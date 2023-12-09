% 2023/04/25
[[X = range(0, 1000, 100) ]] [[ Y = 1000 - X ]] % [[Y]]

set simul system
{
    time_step = 0.005
    viscosity = 0.01
}

set space cell
{
    shape = circle
}

new cell
{
    radius = 30
}

set fiber microtubule
{
    rigidity = 20
    segmentation = 0.2
    total_polymer = 5000
    activity = classic
    growing_speed = 0.080
    shrinking_speed = -0.250
    catastrophe_rate = 0.005
    rescue_rate = 0.06
    growing_force = 1.67
    min_length = 0.1
    % steric = 1, 0.05
}

set hand kinesin5
{
    binding_rate = 10
    binding_range = 0.01
    unbinding_rate = 1
    unbinding_force = 3

    activity = move
    unloaded_speed = 0.05
    stall_force = 6

    display = { size=8; color=0x00FF00FF; }
}

set hand kinesin14
{
    binding_rate = 10
    binding_range = 0.01
    unbinding_rate = 0.1
    unbinding_force = 1

    activity = move
    unloaded_speed = -0.040
    stall_force = 6
    display = { size = 16; color=0x00FF00FF; }
}

set hand kinesin14_eb
{
    binding_rate = 10
    binding_range = 0.01
    unbinding_rate = 0.1
    unbinding_force = 10

    activity = move
    unloaded_speed = -0.040
    stall_force = 10
    display = { size = 16; color=0x0088FFFF; }
}

set hand eb
{
    activity = track
    bind_end = plus_end
    bind_end_range = 0.2

    binding_rate = 10
    binding_range = 0.01
    unbinding_rate = 0.05
    unbinding_force = 5

    bind_only_growing_end = 1
    track_end = 1
    bind_also_end = 1
    display = { size = 16; color=0x0088FFFF; }
}

set couple kinesin5_pair
{
    hand1 = kinesin5
    hand2 = kinesin5

    diffusion = 0.20
    stiffness = 200
}

set couple kinesin14_pair
{
    hand1 = kinesin14
    hand2 = kinesin14

    diffusion = 0.20
    stiffness = 200
    length = 0.01
}

set couple eb_complex
{
    hand1 = eb
    hand2 = kinesin14_eb
    diffusion = 0.20
    stiffness = 200
    length = 0.01
}

set solid core
{
    confine = 1, 100
    display = ( style = 2 )
}

set aster centrosome
{
    stiffness = 2000, 1000
    nucleate = 1, microtubule, ( length = 0.75; plus_end = 1; )
}

new centrosome
{
    solid = core
    radius = 0.5
    position = 1 0 0
    fibers = 100, microtubule, ( plus_end=grow; length=2; )
}


new centrosome
{
    solid = core
    radius = 0.5
    position = -1 0 0
    fibers = 100, microtubule, ( plus_end=grow; length=2; )
}

%new 1000 kinesin_pair
new [[X]] kinesin14_pair
new [[Y]] eb_complex

run system
{
    nb_steps = 200000
    nb_frames = 1000
}
