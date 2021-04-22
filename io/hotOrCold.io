true_value := Random value(1,100) floor
previous_guess := nil
current_guess := nil
10 repeat(
  "What do you guess?" println
  current_guess = File standardInput readLine asNumber
  if(current_guess == true_value, break)
  if(previous_guess,
    if((current_guess - true_value) abs <= (previous_guess - true_value) abs,
    "Hotter" println,
    "Colder" println
    )
  )

  previous_guess = current_guess
)

if(current_guess == true_value, ("Well done. It was indeed " .. true_value) println, ("Bad luck. It was actually" .. true_value) println)
