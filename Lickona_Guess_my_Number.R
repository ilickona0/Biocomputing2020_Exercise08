#guess my number game


#Create vector with values 1-100 to sample from
pool <- 1:100
#generate random correct answer
correct <- sample(pool, size =1)

#Prompt user for a number guess
print("Guess a number between 1 and 100: ")

#Get initial users guess (limited to one at a time) to preallocate the variable
guess <- scan(nmax=1)

#Preallocate number of guesses
guessnum <- 1:9

#Evaluate correctness/high/low and return appropariate answer in a conditional
for (i in guessnum){
    if (guess == correct) {
    print("Correct!")
    break
  } else if (guess > correct) {print("Lower!")
    guess <- scan(nmax =1)
  } else {print("Higher!")
    guess <- scan(nmax=1)
  }
}
print("Thanks for Playing!")


