% SIR model ODEs
function SIR = SIR(t,Y)
    SIR(1,1) = -0.5*Y(1)*Y(2);
    SIR(2,1) = 0.5*Y(1)*Y(2) - 0.2*Y(2);
    SIR(3,1) = 0.2*Y(2);
end