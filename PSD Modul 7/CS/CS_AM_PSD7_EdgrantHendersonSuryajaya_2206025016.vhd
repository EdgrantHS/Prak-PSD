library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity TP_PSD7_EdgrantHendersonSuryajaya_2206025016 is
    port (
        CLK : in std_logic;
        Done : out std_logic;
        averageTemperature, dailyTemperatureChange, averageBranch, dailyBranchChange : in integer;
        numberOfDays : in integer
    );
end TP_PSD7_EdgrantHendersonSuryajaya_2206025016;

architecture rtl of TP_PSD7_EdgrantHendersonSuryajaya_2206025016 is
begin
    process
        variable seed1: integer := 1519;
        variable seed2: integer := 9329;
        --function IntroduceVariant
        impure function IntroduceVariant return integer is
            variable r : real;
        begin
            uniform(seed1, seed2, r);
            return integer(round(r * real(5)));
        end function;

        --function CalculateTemperature
        function CalculateTemperature(averageTemperature, dailyTemperatureChange, introduceVariant : integer) return integer is
            variable dailyTemperature : integer range 100 to 500;
        begin
            dailyTemperature := averageTemperature + dailyTemperatureChange + (introduceVariant * dailyTemperatureChange);
            return dailyTemperature;
        end function;
        
        --function CalculateBranch
        function CalculateBranch(averageBranch, dailyBranchChange, introduceVariant : integer) return integer is
            variable dailyBranch : integer range 0 to 100;
        begin
            dailyBranch := averageBranch + dailyBranchChange + (introduceVariant * dailyBranchChange);
            return dailyBranch;
        end function;
        
        --procedure simulasi
        procedure SimulateSacredTimeline(
            signal numberOfDays, averageTemperature, dailyTemperatureChange, averageBranch, dailyBranchChange : in integer;
            signal CLK : in std_logic;
            signal Done : out std_logic
        ) is
            variable dailyTemperature, dailyBranch : integer;
        begin
            Done <= '0';
            for i in 1 to numberOfDays loop
                dailyTemperature := CalculateTemperature(averageTemperature, dailyTemperatureChange, IntroduceVariant);
                dailyBranch := CalculateBranch(averageBranch, dailyBranchChange, IntroduceVariant);
                report "Simulasi ke-" & integer'image(i);
                report "dailyTemperature = " & integer'image(dailyTemperature);
                report "dailyBranch = " & integer'image(dailyBranch);
                -- wait until rising_edge(CLK);
            end loop;
            Done <= '1';
            wait;
        end procedure;
    begin
        SimulateSacredTimeline(numberOfDays, averageTemperature, dailyTemperatureChange, averageBranch, dailyBranchChange, CLK, Done);
    end process;
end rtl;