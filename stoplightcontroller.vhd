library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Stoplight_Controller is
    Port ( clk     : in  STD_LOGIC;
           reset   : in  STD_LOGIC;
           red     : out STD_LOGIC;
           yellow   : out STD_LOGIC;
           green   : out STD_LOGIC);
end Stoplight_Controller;

architecture Behavioral of Stoplight_Controller is
    type state_type is (RED, GREEN, YELLOW);
    signal current_state, next_state : state_type;
    signal timer : INTEGER := 0;
begin

    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= RED;
            timer <= 0;
        elsif rising_edge(clk) then
            current_state <= next_state;
            if current_state = RED then
                timer <= 0; -- Reset timer for RED
            else
                timer <= timer + 1; -- Increment timer for other states
            end if;
        end if;
    end process;

    process(current_state, timer)
    begin
        case current_state is
            when RED =>
                red <= '1';
                yellow <= '0';
                green <= '0';
                if timer = 5 then  -- Stay in RED for 5 time units
                    next_state <= GREEN;
                else
                    next_state <= RED;
                end if;

            when GREEN =>
                red <= '0';
                yellow <= '0';
                green <= '1';
                if timer = 3 then  -- Stay in GREEN for 3 time units
                    next_state <= YELLOW;
                else
                    next_state <= GREEN;
                end if;

            when YELLOW =>
                red <= '0';
                yellow <= '1';
                green <= '0';
                if timer = 2 then  -- Stay in YELLOW for 2 time units
                    next_state <= RED;
                else
                    next_state <= YELLOW;
                end if;

            when others =>
                next_state <= RED; -- Default case
        end case;
    end process;

end Behavioral;