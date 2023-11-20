library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity voteSystem_tb is
end entity voteSystem_tb;

architecture rtl of voteSystem_tb is
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

    --   constant input_stream : integer --array of integer, tapi gak jadi
    constant DELAY : time := 100 ps;

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

    tb_1: process
    begin
        input <= 1;
        wait until rising_edge(CLK);
        input <= 1;
        wait until rising_edge(CLK);
        input <= 3;
        wait until rising_edge(CLK);
        input <= 2;
        wait until rising_edge(CLK);
        input <= 4;
        wait until rising_edge(CLK);
        input <= 4;
        wait until rising_edge(CLK);
        input <= 4;
        wait until rising_edge(CLK);
        wait;
    end process tb_1;

end architecture rtl;
