using Pkg
Pkg.add("Makie")
Pkg.add("AbstractPlotting")
using Makie
using AbstractPlotting
using AbstractPlotting.MakieLayout
AbstractPlotting.inline!(true)

#Collins toggle switch
#u is the concentration of repressor 1
#v is the concentration of repressor 2 
#plot for n=1
function delta_dynamics(u,v)
       
    f = 10/(1+v)-u     #du/dt
    g = 10/(1+u)-v     #dv/dt
    
    return Point(f,g)
end
# Construct the streamplot
#axes are x=v and y=u
plt1 = Scene(resolution =(400,400))
streamplot!(plt1, delta_dynamics, 0..35, 0..35, colormap = :plasma, 
    gridsize= (32,32), arrow_size = 0.1)
# Display the plot
display(plt1)
# Save the plot
save("odeField.png", plt1)

#plot for n=2
function delta_dynamics2(u,v)
       
    f = 10/(1+v^2)-u     #du/dt
    g = 10/(1+u^2)-v     #dv/dt
    
    return Point(f,g)
end
# Construct the streamplot

plt2 = Scene(resolution =(400,400))
streamplot!(plt2, delta_dynamics2, 0..35, 0..35, colormap = :plasma, 
    gridsize= (32,32), arrow_size = 0.1)
# Display the plot
display(plt2)
# Save the plot
save("odeField.png", plt2)