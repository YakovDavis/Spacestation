if (closing&&opening)
	opening = false;

if (opening)
{
	if (rel_y > 0)
		rel_y -= 0.5;
	else
	{
		opening = false;
		opened = true;
	}
}

if (closing)
{
	if (rel_y < 60)
		rel_y += 0.5;
	else
	{
		closing = false;
		opened = false;
	}
}