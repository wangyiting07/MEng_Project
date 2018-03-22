answer=1; % this is where we'll store the user's answer
arduino=serial('COM4','BaudRate',9600); % create serial communication object on port COM4
 
fopen(arduino); % initiate arduino communication
 
while answer
    fprintf(arduino,'%d',answer); % send answer variable content to arduino
    answer=input('Enter led value 1 or 2 (1=ON, 2=OFF, 0=EXIT PROGRAM): '); % ask user to enter value for variable answer
end
 
fclose(arduino); % end communication with arduino