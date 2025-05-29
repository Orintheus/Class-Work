library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Stoplight_Controller is
end tb_Stoplight_Controller;

architecture Behavioral of tb_Stoplight_Controller is

    -- Component Declaration for the Unit Under Test (UUT)
    component Stoplight_Controller
        Port ( clk     : in  STD_LOGIC;
               reset   : in  STD_LOGIC;
               red     : out STD_LOGIC;
               yellow   : out STD_LOGIC;
               green   : out STD_LOGIC);
    end component;

    -- Signals for connecting to the UUT
    signal clk     : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';
    signal red     : STD_LOGIC;
    signal yellow   : STD_LOGIC;
    signal green   : STD_LOGIC;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Stoplight_Controller
        Port map (
            clk => clk,
            reset => reset,
            red => red,
            yellow => yellow,
            green => green
        );

    -- Clock generation process
    clk_process :process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_process: process
    begin
        -- Apply reset
        reset <= '1';
        wait for 20 ns;  -- Hold reset for a while
        reset <= '0';
        
        -- Wait for some time to observe the state changes
        wait for 100 ns;  -- Observe the output for 100 ns

        -- You can add more stimulus or checks here if needed

        -- Finish simulation
        wait;
    end process;

end Behavioral;