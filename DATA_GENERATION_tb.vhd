library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Random_Data_Generator_tb is
end Random_Data_Generator_tb;

architecture test of Random_Data_Generator_tb is

    -- Signals for testbench
    signal clk         : std_logic := '0';
    signal reset       : std_logic := '1';
    signal random_data : std_logic_vector(7 downto 0);

    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Random Data Generator
    uut: entity work.Random_Data_Generator
        port map (
            clk => clk,
            reset => reset,
            random_data => random_data
        );

    -- Clock generation process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- Test process
    stimulus: process
    begin
        -- Initial reset
        reset <= '1';
        wait for 30 ns;
        reset <= '0';
        
        -- Let the random generator run
        wait for 200 ns;
        
        -- End simulation
        wait;
    end process;

end test;

