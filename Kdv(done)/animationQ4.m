for i=1:5000:200001
plot(0:0.01:1,Q4Extra(3:103,i))
axis([0 1 -2 2])
pause(0.2)
i
end
