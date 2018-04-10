// 002 u_c_byte_buffer
// 09 may 2005

// -- (C) Felix John COLIBRI 2004
// -- documentation: http://www.felix-colibri.com

(*$r+*)

unit u_c_byte_buffer;
  interface
    uses u_c_basic_object;

    type c_byte_buffer= class(c_basic_object)
                          m_buffer_size: Integer;
                          m_oa_byte_buffer: Array of Byte;

                          m_read_index: Integer;
                          // -- this is manipulated by the socket after the reception
                          m_write_index: Integer;

                          // -- used to display newly received data
                          m_display_index: Integer;

                          Constructor create_byte_buffer(p_name: String; p_buffer_size: Integer);

                          function f_c_self: c_byte_buffer;

                          procedure display_buffer(p_start_index, p_end_index: Integer);
                          procedure display_buffer_hex(p_start_index, p_end_index: Integer);

                          procedure double_the_capacity;
                          procedure clear_buffer;

                          function f_compare_string(p_index: Integer; p_string: String): Boolean;

                          function f_character_distance(p_index: Integer; p_character: Char): Integer;
                          function f_string_position(p_index: Integer; p_string: String): Integer;
                          function f_next_2_new_line_position(p_index: Integer): Integer;

                          function f_extract_string_start_end(p_start, p_end: Integer): String;
                          function f_extract_string_start_end_max(p_start, p_end: Integer): String;

                          procedure remove_from_start(p_count: Integer);
                          function f_c_extract_start_buffer(p_end: Integer): c_byte_buffer;

                          function f_skip_return_line_feed(var pv_index: Integer): Boolean;
                          function f_return_line_feed_position(p_index: Integer): Integer;
                          function f_quote_position(p_index: Integer): Integer;
                          function f_character_position(p_character: Char; p_index: Integer): Integer;

                          function f_search_string(var pv_index: Integer; p_search_string: String): Integer;
                          function f_pos(p_search_string: String): Integer;
                          function f_last_return_index: Integer;

                          procedure load_from_file(p_full_file_name: String);

                          Destructor Destroy; Override;
                        end; // c_byte_buffer

    procedure display_buffer(p_pt: Pointer; p_start, p_end: Integer);

  implementation
    uses SysUtils, u_types_constants, u_characters, u_c_display, u_display_hex_2;

    procedure display_buffer(p_pt: Pointer; p_start, p_end: Integer);
      var l_index: Integer;
          l_character: Char;
          l_text: String;
      begin
        l_text:= '%';

        for l_index:= p_start to p_end do
        begin
          (*$r-*)
          l_character:= t_pt_characters(p_pt)^[l_index];
          (*$r+*)
          case l_character of
            k_return : begin
                         if l_text= ''
                           then l_text:= '|';
                         l_text:= l_text+ '#13';
                       end;
            k_line_feed : begin
                           l_text:= l_text+ '#10';
                           if l_index= p_end
                             then display(l_text+ '%')
                             else display(l_text);
                           l_text:= '';
                          end
            else
              if l_text= ''
                then l_text:= '|';
              l_text:= l_text+ l_character;
          end; // case
        end; // for l_index

        if l_text<> ''
          then display(l_text+ '%');
      end; // display_buffer

    // -- c_byte_buffer

    Constructor c_byte_buffer.create_byte_buffer(p_name: String; p_buffer_size: Integer);
      begin
        Inherited create_basic_object(p_name);

        m_buffer_size:= p_buffer_size;
        SetLength(m_oa_byte_buffer, m_buffer_size)
      end; // create_byte_buffer

    function c_byte_buffer.f_c_self: c_byte_buffer;
      begin
        Result:= Self;
      end; // f_c_self

    procedure c_byte_buffer.display_buffer(p_start_index, p_end_index: Integer);
      begin
        u_c_byte_buffer.display_buffer(@ m_oa_byte_buffer[0], p_start_index, p_end_index);
      end; // display_buffer

    procedure c_byte_buffer.display_buffer_hex(p_start_index, p_end_index: Integer);
      begin
        display(f_display_hex(@ m_oa_byte_buffer[p_start_index], p_end_index+ 1- p_start_index, 16, k_hex_default));
      end; // display_buffer_hex

    procedure c_byte_buffer.double_the_capacity;
      begin
        m_buffer_size:= 2* m_buffer_size;
        SetLength(m_oa_byte_buffer, m_buffer_size);
      end; // double_the_capacity

    procedure c_byte_buffer.clear_buffer;
      begin
        FillChar(m_oa_byte_buffer[0], Length(m_oa_byte_buffer), 0);
        m_read_index:= 0; m_write_index:= 0; m_display_index:= 0;
      end; // clear_buffer

    // -- buffer analysis routines

    function c_byte_buffer.f_compare_string(p_index: Integer; p_string: String): Boolean;
        // -- extract a string <index> and compare it to p_string
      var l_length: Integer;
          l_string: String;
      begin
        l_length:= Length(p_string);
        if l_length> 0
          then begin
              SetLength(l_string, l_length);
              Move(m_oa_byte_buffer[p_index], l_string[1], l_length);
              Result:= LowerCase(l_string)= LowerCase(p_string);
            end
          else Result:= False;
      end; // f_compare_string

    function c_byte_buffer.f_character_distance(p_index: Integer; p_character: Char): Integer;
        // -- starting at p_index, search a character
        // --   returns the distance of the character from p_index
      begin
        Result:= 0;
        while (p_index+ Result< m_write_index) and (m_oa_byte_buffer[p_index+ Result]<> Ord(p_character)) do
          Inc(Result);

        if p_index+ Result>= m_write_index
          then Result:= -1;
      end; // f_character_distance

    function c_byte_buffer.f_string_position(p_index: Integer; p_string: String): Integer;
        // -- starting from p_index, look for p_string
        // -- if within buffer
        // --   then returns the position or the first character
        // --   else returns the negative last searched position
        // -- case INSENSITIVE
      var l_length: Integer;
          l_found: Boolean;
          l_index: Integer;
          l_string: String;
      begin
        l_length:= Length(p_string);
        if l_length<= 0
          then begin
              Result:= - p_index;
              Exit;
            end;

        l_string:= LowerCase(p_string);
        Result:= p_index;
        while Result<= m_write_index- l_length do
        begin
          if f_lower_case(Chr(m_oa_byte_buffer[Result]))= l_string[1]
            then begin
                l_found:= True;
                for l_index:= 1 to l_length- 1 do
                begin
                  if f_lower_case(Chr(m_oa_byte_buffer[Result+ l_index]))<> l_string[1+ l_index]
                    then begin
                        l_found:= False;
                        Break;
                      end;
                end; // for l_index

                if l_found
                  then Exit
                  else Inc(Result);
              end
            else Inc(Result);
        end; // while

        // -- did not find. Result in 1 position too far
        // -- get back
        Dec(Result);
        if Result< p_index
          then Result:= p_index;

        // -- failure
        Result:= - Result;
      end; // f_string_position

    function c_byte_buffer.f_next_2_new_line_position(p_index: Integer): Integer;
        // -- starting from p_index, look for 2 new_line
        // -- if within buffer
        // --   then returns the position or the first character of the 2 return/line feed
        // --   else returns the negative last searched position
      begin
        Result:= p_index;
        while Result<= m_write_index- 1- 3 do
        begin
          if m_oa_byte_buffer[Result]= Ord(k_return)
            then begin
                if      (m_oa_byte_buffer[Result+ 1]= Ord(k_line_feed))
                    and (m_oa_byte_buffer[Result+ 2]= Ord(k_return))
                    and (m_oa_byte_buffer[Result+ 3]= Ord(k_line_feed))
                  then begin
                      Exit;
                    end
                  else Inc(Result);
              end
            else Inc(Result);
        end; // while

        // -- get back
        Dec(Result);
        if Result< p_index
          then Result:= p_index;

        // -- failure
        Result:= - Result;
      end; // f_next_2_new_line_index

    function c_byte_buffer.f_extract_string_start_end(p_start, p_end: Integer): String;
        // -- extract but does not touch the start / end indexes
      var l_length: Integer;
      begin
        // display('ext '+ IntToStr(p_start)+ '..'+ IntToStr(p_end));

        if (p_start> p_end) or (p_start< 0) or (p_end>= m_write_index)
          then begin
              display('*** c_byte_buffer.ix_error '+ m_name
                + Format('%5d..%5d  w=%5d ', [p_start, p_end, m_write_index]));
              Result:= '';
              Exit;
            end;

        l_length:= p_end+ 1- p_start;
        if l_length= 0
          then Result:= ''
          else begin
              SetLength(Result, l_length);
              Move(m_oa_byte_buffer[p_start], Result[1], l_length);
            end;
      end; // f_extract_string_start_end

    function c_byte_buffer.f_extract_string_start_end_max(p_start, p_end: Integer): String;
        // -- do not yell if p_end> m_write_index
      var l_length: Integer;
      begin
        // display('ext '+ IntToStr(p_start)+ '..'+ IntToStr(p_end));

        if (p_start> p_end) or (p_start< 0) or (p_start>= m_write_index)
          then begin
              display('ix_error '+ m_name
                + Format('%5d..%5d  w=%5d ', [p_start, p_end, m_write_index]));
              Result:= '';
              Exit;
            end;

        if p_end>= m_write_index
          then p_end:= m_write_index- 1;

        l_length:= p_end+ 1- p_start;
        if l_length= 0
          then Result:= ''
          else begin
              SetLength(Result, l_length);
              Move(m_oa_byte_buffer[p_start], Result[1], l_length);
            end;
      end; // f_extract_string_start_end_max

    procedure c_byte_buffer.remove_from_start(p_count: Integer);
        // -- shift the data by removing 0..p_count- 1
      var l_end_length: Integer;
      begin
        l_end_length:= m_write_index- p_count;
        Move(m_oa_byte_buffer[p_count], m_oa_byte_buffer[0], l_end_length);
        Dec(m_read_index, p_count);
        Dec(m_write_index, p_count);
        Dec(m_display_index, p_count);
      end; // remove_from_start

    function c_byte_buffer.f_c_extract_start_buffer(p_end: Integer): c_byte_buffer;
        // -- create a new c_byte_buffer, and remove from the parent
        // -- Extracts 0..p_end
      var l_length: Integer;
      begin
        if (p_end< 0) or (p_end>= m_write_index)
          then begin
              display('ix_error ');
              Result:= c_byte_buffer.create_byte_buffer('buf_', 0);
              Exit;
            end;

        l_length:= p_end+ 1;
        Result:= c_byte_buffer.create_byte_buffer('buf_', l_length);
        if l_length> 0
          then begin
              Move(m_oa_byte_buffer[0], Result.m_oa_byte_buffer[0], l_length);
              // -- this is used as max in extraction routines
              Result.m_write_index:= l_length;

              // -- remove this content from parent
              remove_from_start(l_length);
            end;
      end; // f_c_extract_start_buffer

    // -- protocol oriented

    function c_byte_buffer.f_skip_return_line_feed(var pv_index: Integer): Boolean;
        // -- increment the parameter beyond Return Line-feed
        // -- if only Return, stay before
        // -- Result true if found
      begin
        while (pv_index< m_write_index)
            and (m_oa_byte_buffer[pv_index]<> k_ord_return) do
          Inc(pv_index);

        if (pv_index+ 1< m_write_index)
            and (m_oa_byte_buffer[pv_index]= k_ord_return)
            and (m_oa_byte_buffer[pv_index+ 1]= k_ord_linefeed)
          then begin
              Inc(pv_index, 2);
              Result:= True;
            end
          else Result:= False;
      end; // f_skip_return_line_feed

    function c_byte_buffer.f_return_line_feed_position(p_index: Integer): Integer;
        // -- return the index after Return-Line_feed, or -1
      begin
        while (p_index< m_write_index)
            and (m_oa_byte_buffer[p_index]<> k_ord_return) do
          Inc(p_index);

        if (p_index+ 1< m_write_index)
            and (m_oa_byte_buffer[p_index]= k_ord_return)
            and (m_oa_byte_buffer[p_index+ 1]= k_ord_linefeed)
          then Result:= p_index+ 2
          else Result:= -1;
      end; // f_return_line_feed_position

    function c_byte_buffer.f_quote_position(p_index: Integer): Integer;
      begin
        while (p_index< m_write_index)
            and (m_oa_byte_buffer[p_index]<> ord('"')) do
          Inc(p_index);

        if (p_index< m_write_index)
            and (m_oa_byte_buffer[p_index]= ord('"'))
          then Result:= p_index
          else Result:= -1;
      end; // f_quote_position

    function c_byte_buffer.f_character_position(p_character: Char; p_index: Integer): Integer;
      begin
        while (p_index< m_write_index)
            and (m_oa_byte_buffer[p_index]<> ord(p_character)) do
          Inc(p_index);

        if (p_index< m_write_index)
            and (m_oa_byte_buffer[p_index]= ord(p_character))
          then Result:= p_index
          else Result:= -1;
      end; // f_character_position

    function c_byte_buffer.f_search_string(var pv_index: Integer; p_search_string: String): Integer;
        // -- search string
        // --  return position of first character or -1 if not found
        // --  AND move the pointer after the searched string, or the end
        // --  ?? bounded by m_buffer_size (not m_write_index ?)

      function f_search_rest(p_index: Integer): Boolean;
        var l_word_index: Integer;
            l_begin, l_end: Integer;
            // l_context: String;
        begin
          l_word_index:= 2;
          while (l_word_index<= Length(p_search_string))
              and (p_index+ l_word_index<= m_buffer_size)
              and (p_search_string[l_word_index]= chr(m_oa_byte_buffer[p_index+ l_word_index- 1])) do
            inc(l_word_index);

          Result:= l_word_index> Length(p_search_string);

          if Result
            then begin
                l_begin:= p_index- 10;
                if l_begin< 0
                  then l_begin:= 0;
                l_end:= p_index+ Length(p_search_string)+ 10;
                if l_end>= m_buffer_size
                  then l_end:= m_buffer_size- 1;

                display(IntToStr(l_begin)+ ' '+ IntToStr(l_end));
              end;
        end; // f_search_rest

      var l_first_character: Char;

      begin // f_search_string
        l_first_character:= p_search_string[1];

        while pv_index< m_buffer_size do
        begin
          if m_oa_byte_buffer[pv_index]= ord(l_first_character)
            then
              if f_search_rest(pv_index)
                then begin
                    display('found at '+ IntToHex(pv_index, 4));
                    exit;
                  end;

          inc(pv_index);
        end; // while pv_index

        Result:= -1;
      end; // f_search_string

    function c_byte_buffer.f_pos(p_search_string: String): Integer;
      var l_index: Integer;
      begin
        l_index:= 0;
        Result:= f_search_string(l_index, p_search_string);
      end; // f_pos

    function c_byte_buffer.f_last_return_index: Integer;
        // -- from the end, the last RETURN
      begin
        Result:= m_write_index- 1;
        while (m_write_index> 0) and (m_oa_byte_buffer[Result]<> Ord(k_return)) do
          Dec(Result);
      end; // f_last_return_index

    procedure c_byte_buffer.load_from_file(p_full_file_name: String);
      var l_file: File;
      begin
        m_read_index:= 0; m_display_index:= 0;

        AssignFile(l_file, p_full_file_name);
        Reset(l_file, 1);

        m_write_index:= FileSize(l_file);
        SetLength(m_oa_byte_buffer, m_write_index);

        BlockRead(l_file, m_oa_byte_buffer[0], m_write_index);

        CloseFile(l_file);
      end; // load_from_file

    Destructor c_byte_buffer.Destroy;
      begin
        m_oa_byte_buffer:= Nil;
        Inherited;
      end; // Destroy

    begin // u_c_byte_buffer
    end. // u_c_byte_buffer
