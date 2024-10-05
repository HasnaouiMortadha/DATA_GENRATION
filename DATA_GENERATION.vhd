library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity Declaration
entity Random_Data_Generator is
    Port ( clk        : in  std_logic;
           reset      : in  std_logic;
           random_data: out std_logic_vector(7 downto 0)
          );
end Random_Data_Generator;

-- Architecture
architecture Behavioral of Random_Data_Generator is

    signal lfsr : std_logic_vector(7 downto 0) := "00000001"; -- Initial seed for LFSR

begin

    process(clk, reset)
    begin
        if reset = '1' then
            lfsr <= "00000001"; -- Reset LFSR to seed value
        elsif rising_edge(clk) then
            -- Linear Feedback Shift Register (LFSR) for random number generation
            lfsr(0) <= lfsr(7);  -- Shift bits
            lfsr(1) <= lfsr(0);
            lfsr(2) <= lfsr(1);
            lfsr(3) <= lfsr(2) xor lfsr(7);  -- XOR feedback for randomness
            lfsr(4) <= lfsr(3);
            lfsr(5) <= lfsr(4);
            lfsr(6) <= lfsr(5);
            lfsr(7) <= lfsr(6);
        end if;
    end process;

    -- Output random data
    random_data <= lfsr;

end Behavioral;

