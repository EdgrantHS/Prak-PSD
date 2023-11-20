library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity voteSystem_tb2 is
end entity voteSystem_tb2;

architecture rtl of voteSystem_tb2 is
    component voteSystem is
        port (
          input   : IN integer;
          oneHot  : OUT STD_LOGIC_VECTOR(3 downto 0);
          vote1   : INOUT integer;
          vote2   : INOUT integer;
          vote3   : INOUT integer;
          vote4   : INOUT integer;
          CLK     : IN STD_LOGIC;
          highest : INOUT integer
        );
      end component voteSystem;

      signal input : integer; --input
      signal vote1, vote2, vote3, vote4, highest : integer; --output
      signal CLK : STD_LOGIC;
      signal oneHOT : STD_LOGIC_VECTOR(3 downto 0);

begin
       


    -- membuat unit under test
    UUT : voteSystem port map (
        input => input, 
        oneHOT => oneHOT, 
        vote1 => vote1, 
        vote2 => vote2, 
        vote3 => vote3, 
        vote4 => vote4,
        CLK => CLK, 
        highest => highest
    );

    process
        file text_file : text open read_mode is "stimulus.txt"; --nama file dan mode pembukaan file
        variable text_line : line;
        variable fileinp : integer; --variabel yang akan menerima data dari file
        variable ok : boolean; --status pembacaan file
        variable delay : time; --status pembacaan file

        begin
            -- file_open(text_file, "stimulus.txt",  read_mode);
            input <= 0;
            while not endfile(text_file) loop --loop hingga akhir dari text file
                readline(text_file, text_line); --membaca kolom pada line

                -- Skip line kosong ataupun comment yang diawali dengan '#'
                if text_line.all'length = 0 or text_line.all(1) = '#' then
                    next;
                end if;

                read(text_line, delay, ok); --membaca variabel pada baris dan memasukkannya ke fileinp
                assert ok report "Read 'sel' failed for line: " & text_line.all severity failure;
                read(text_line, fileinp, ok); --membaca variabel pada baris dan memasukkannya ke fileinp
                assert ok report "Read 'sel' failed for line: " & text_line.all severity failure;
                
                input <= fileinp;
                CLK <= '0';
                wait for delay/2; --delay iterasi pembacaan
                CLK <= '1';
                wait for delay/2; --delay iterasi pembacaan
            end loop; 
            wait;
    end process;

end architecture rtl;
