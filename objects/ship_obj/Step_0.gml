get_input_scr();
instance_create_depth(x, y, 15, trail_obj);

absolute_height = point_distance(x, y, planet_obj.x, planet_obj.y);
gravity_strenght = gravity_constant / (absolute_height * absolute_height);

if (distance_to_object(planet_obj) > max_h) max_h = distance_to_object(planet_obj);

hdir = downwards - upwards;
vdir = retrograde - prograde;

sphere_of_influence = instance_nearest(x, y, planet_obj);
gravity_angle = point_direction(sphere_of_influence.x, sphere_of_influence.y, x, y);
physics_apply_force(x, y, gravity_strenght * -cos(degtorad(gravity_angle)), gravity_strenght * sin(degtorad(gravity_angle)));

if (!(vdir == 0 && hdir == 0))
{
	burn_angle = point_direction(x, y, x + hdir, y + vdir);
	physics_apply_force(x, y, twr * -cos(degtorad(gravity_angle + burn_angle)), twr * sin(degtorad(gravity_angle + burn_angle)));
}
