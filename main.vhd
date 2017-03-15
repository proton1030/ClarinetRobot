LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity main is
PORT (clock2,reset2: IN STD_LOGIC;
fingerlay: OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END main;
ARCHITECTURE main2 OF main IS 
component noteplay IS
PORT (clock,reset: IN STD_LOGIC;
finger: OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END component;
component split IS
PORT (clocks,resets: IN STD_LOGIC;
flips:BUFFER STD_LOGIC);
END component;
component timectrl IS
PORT (clockt,resett: IN STD_LOGIC;
timeout:BUFFER STD_LOGIC);
END component;
signal tempclock,tempclock2:STD_LOGIC;
begin
u1 : split port map (clocks=>clock2,resets=>reset2,flips=>tempclock);
u2 : timectrl port map (clockt=>tempclock,resett=>reset2,timeout=>tempclock2);
u3 : noteplay port map (clock=>tempclock2,reset=>reset2,finger=>fingerlay);

end architecture main2;