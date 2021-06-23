pkg load arduino
pkg load io
arduinosetup
% Enviar código para o arduino na IDE Arduino

arduno = arduino() % veja a porta ou deixe ("COM3") para geral
pins = arduno.availablepins % ver portas do arduino
writeDigitalPin (arduno,  "d2", true)
writeDigitalPin (arduno,  "d3", true)
pause(10)
writeDigitalPin (arduno,  "d2", true)
writeDigitalPin (arduno,  "d3", true)
readDigitalPin (arduno,  "d2")
readDigitalPin (arduno,  "d3")
