library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity voteSystem is
  port (
    input   : IN integer;
    oneHot  : OUT STD_LOGIC_VECTOR(3 downto 0);
    vote1   : INOUT integer := 0;
    vote2   : INOUT integer := 0;
    vote3   : INOUT integer := 0;
    vote4   : INOUT integer := 0;
    CLK     : IN STD_LOGIC;
    highest : INOUT integer := 0
  );
end entity voteSystem;

architecture rtl of voteSystem is
  signal highestVote : integer := 0;
begin

  -- highestVote <= vote1; --# ** Error: voteSystem.vhd(23): near "highestVote": syntax error
  process(CLK)
  begin
    if falling_edge(CLK) then
      if input = 1 then
        oneHot <= "1000";
        vote1 <= vote1 + 1;
      elsif input = 2 then
        oneHot <= "0100";
        vote2 <= vote2 + 1;
      elsif input = 3 then 
        oneHot <= "0010";
        vote3 <= vote3 + 1;
      elsif input = 4 then
        oneHot <= "0001";
        vote4 <= vote4 + 1;
      else
        oneHot <= "0000";
        report "Input invalid" severity WARNING;
      end if;

      -- Check and update highestVote for all candidates
      if vote1 > highestVote then
        highestVote <= vote1;
        highest <= 1;
      end if;
      if vote2 > highestVote then
        highestVote <= vote2;
        highest <= 2;
      end if;
      if vote3 > highestVote then
        highestVote <= vote3;
        highest <= 3;
      end if;
      if vote4 > highestVote then
        highestVote <= vote4;
        highest <= 4;
      end if;
    end if;
  end process;
end architecture rtl;
