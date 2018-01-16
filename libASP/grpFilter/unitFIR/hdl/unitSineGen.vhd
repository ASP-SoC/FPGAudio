library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  --try to use this library as much as possible.

entity sinewave is
port (clk :in  std_logic;
      dataout : out real
      );
end sinewave;

architecture Behavioral of sinewave is
signal i : integer range 0 to 30:=0;
type memory_type is array (0 to 29) of real range -1.0 to 1.0;
--ROM for storing the sine values generated by MATLAB.
signal sine : memory_type :=(0.0,0.21,0.40,0.58,0.75,0.87,0.96,1.0,1.0,0.96,0.87,0.75,0.58,0.40,0.21,0.0,
-0.21,-0.40,-0.58,-0.75,-0.87,-0.96,-1.0,-1.0,-0.96,-0.87,-0.75,-0.58,-0.40,-0.21);

begin

process(clk)
begin
  --to check the rising edge of the clock signal
if(rising_edge(clk)) then    
dataout <= sine(i);
i <= i+ 1;
if(i = 29) then
i <= 0;
end if;
end if;
end process;

end Behavioral;