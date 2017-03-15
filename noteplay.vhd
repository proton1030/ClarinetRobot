LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY noteplay IS
PORT (clock,reset: IN STD_LOGIC;
finger: OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END noteplay;
ARCHITECTURE main OF noteplay IS 
type notes is (EL,FL,FSL,GL,GSL,AL,ASL,BL,C,CS,D,DS,E,F,FS,G,GS,A,AS,B,CH,CSH,DH,DSH,EH,FH,FSH,GH,GSH,AH,ASH,BH,CU,CSU,DU,DSU,EU,FU,FSU,GU);
type notesarr is array (64 downto 0) of notes;
signal current_state:notes;
signal scoreA : notesarr;
begin

scoreA<=(G,FS,F,E,DS,GS,G,FS,G,FS,F,E,DS,E,F,FS,G,FS,F,E,DS,GS,G,FS,G,FS,F,E,DS,E,F,FS,G,FS,F,E,F,E,DS,D,DS,E,F,FS,G,GS,G,FS,G,FS,F,E,F,E,DS,D,DS,E,F,FS,G,GS,G,FS,G);

reg:process (reset,clock)
variable currentlength : integer:=65;
begin

if reset = '0' then current_state <=G; currentlength:=65;
elsif clock='1' and clock'event then
if currentlength>0 or currentlength=0 then
current_state <= scoreA(currentlength); currentlength:=(currentlength-1);
elsif currentlength<0 then
current_state <= G;
end if;

case current_state is
when EL => finger<="0100110101011101";
when FL => finger<="0100110100011101";
when FSL =>finger<="0100110100111101";
when GL => finger<="0100110100011100";
when GSL =>finger<="0100110100011110";
when AL => finger<="0100110100011000";
when ASL =>finger<="0100110100010000";
when BL => finger<="0100110100001000";
when C =>finger<="0100110100000000";
when CS => finger<="0100110110000000";
when D =>finger<="0100110000000000";
when DS => finger<="0100111000000000";
when E =>finger<="0100100000000000";
when F => finger<="0100000000000000";
when FS =>finger<="0000100000000000";
when G => finger<="0000000000000000";
when GS =>finger<="0001000000000000";
when A => finger<="0010000000000000";
when AS =>finger<="1010000000000000";
when B => finger<="1100110101011101";
when CH =>finger<="1100110100011101";
when CSH => finger<="1100110100111101";
when DH =>finger<="1100110100011100";
when DSH => finger<="1100110100011110";
when EH =>finger<="1100110100011000";
when FH => finger<="1100110100010000";
when FSH =>finger<="1100110100001000";
when GH => finger<="1100110100000000";
when GSH =>finger<="1100110110000000";
when AH => finger<="1100110000000000";
when ASH =>finger<="1100111000000000";
when BH => finger<="1100100000000000";
when CU =>finger<="1100000000000000";
when CSU => finger<="1100010100011000";
when DU =>finger<="1100010100010010";
when DSU => finger<="1100010100001010";
when EU =>finger<="1100010100000010";
when FU => finger<="0000000000000000";
when FSU =>finger<="0000000000000000";
when GU => finger<="0000000000000000";
end case;
end if;
end process;
end architecture main;