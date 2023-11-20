library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;


entity CS_RF_PSD8_EdgrantHendersonSuryajaya_2206025016 is
    port (
        CLK : in std_logic;
        dataIn : in std_logic_vector (15 downto 0);
        key : in std_logic_vector (3 downto 0);
        mode : in std_logic;
        enable : in std_logic;
        dataOut : out std_logic_vector (15 downto 0)
    );
end CS_RF_PSD8_EdgrantHendersonSuryajaya_2206025016;

architecture rtl of CS_RF_PSD8_EdgrantHendersonSuryajaya_2206025016 is
    type state is (SINIT, SADD, SXOR, SSWAP, SSUB, SDONE);
    signal currentState, nextState : state := SINIT;

    -- init
    function fInit(oldKey : std_logic_vector) return std_logic_vector  is
    begin
        return oldKey & oldKey & oldKey & oldKey;
    end function;

    -- add
    function fAdd(data, newKey : std_logic_vector ) return std_logic_vector  is
        variable oldKey : unsigned (3 downto 0) := unsigned(newKey(3 downto 0));
        variable block0 : unsigned (3 downto 0) := unsigned(data(3 downto 0));
        variable block1 : unsigned (3 downto 0) := unsigned(data(7 downto 4));
        variable block2 : unsigned (3 downto 0) := unsigned(data(11 downto 8));
        variable block3 : unsigned (3 downto 0) := unsigned(data(15 downto 12));
    begin
        block0 := block0 + oldKey;
        block1 := block1 + oldKey;
        block2 := block2 + oldKey;
        block3 := block3 + oldKey;
        
        return std_logic_vector(block3 & block2 & block1 & block0);
    end function;

    -- xor
    function fXor(data, newKey : std_logic_vector ) return std_logic_vector  is
    begin
        return data xor newKey;
    end function;
    
    -- swap
    function fSwap(data: std_logic_vector ) return std_logic_vector  is
    begin
        return data(7 downto 0) & data(15 downto 8);
    end function;

    -- subtract
    function fSub(data, newKey : std_logic_vector) return std_logic_vector  is
        variable oldKey : unsigned (3 downto 0) := unsigned(newKey(3 downto 0));
        variable block0 : unsigned (3 downto 0) := unsigned(data(3 downto 0));
        variable block1 : unsigned (3 downto 0) := unsigned(data(7 downto 4));
        variable block2 : unsigned (3 downto 0) := unsigned(data(11 downto 8));
        variable block3 : unsigned (3 downto 0) := unsigned(data(15 downto 12));
    begin
        block0 := block0 - oldKey;
        block1 := block1 - oldKey;
        block2 := block2 - oldKey;
        block3 := block3 - oldKey;
        
        return std_logic_vector(block3 & block2 & block1 & block0);
    end function;

    -- Done
    function fDone(data : std_logic_vector) return std_logic_vector  is
    begin
        return data;
    end function;

    signal tempData : std_logic_vector (15 downto 0);
    signal longKey : std_logic_vector (15 downto 0);
begin
    -- Mengupdate state setiap clocktick
    clock_upadte: process(clk)
    begin
        if rising_edge(clk) then
            currentState <= nextState;
        end if;
    end process clock_upadte;

    -- state is (SINIT, SADD, SXOR, SSWAP, SSUB, SDONE);
    -- Mengupdate state
    state_update: process
    begin
        case currentState is
            when SINIT =>
                tempData <= dataIn;
                nextState <= SADD;
                if enable = '1' then 
                    longKey <= fInit(key);
                end if;
            
            when SADD =>
                tempData <= fAdd(tempData, longKey);
                if mode = '0' then
                    nextState <= SXOR;
                else
                    nextState <= SSWAP;
                end if;
            
            when SXOR =>
                tempData <= fXor(tempData, longKey);
                if mode = '0' then
                    nextState <= SSWAP;
                else
                    nextState <= SSUB;
                end if;
        
            when SSWAP =>
                tempData <= fSwap(tempData);
                if mode = '0' then
                    nextState <= SSUB;
                else
                    nextState <= SXOR;
                end if;
        
            when SSUB =>
                nextState <= SDONE;
                tempData <= fSub(tempData, longKey);
        
            when SDONE =>
                nextState <= SINIT;
                dataOut <= fDone(tempData);
        end case;
        wait until falling_edge(clk);
    end process state_update;
end rtl;