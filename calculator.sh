#!/bin/bash

# Function to add two numbers
add() {
   echo "scale=2; $1 + $2" | bc
}

# Function to subtract two numbers
subtract() {
   echo "scale=2; $1 - $2" | bc
}

# Function to multiply two numbers
multiply() {
   echo "scale=2; $1 * $2" | bc
}

# Function to divide two numbers
division() {
   echo "scale=2; $1 / $2" | bc
}

# Function to calculate square using multiplication
square() {
   echo "scale=2; $1 * $1" | bc
}

# Function to calculate power
power() {
   echo "scale=2; $1 ^ $2" | bc
}

# Function to calculate square root
sqrt() {
   echo "scale=2; sqrt($1)" | bc
}

# Prompt the user to choose an operation
echo "Choose an operation: add, subtract, multiply, divide, square, power, sqrt"
read operation

# Perform the operation based on user input
case $operation in
   add | subtract | multiply | divide)
      # For add, subtract, multiply, and divide, prompt for two numbers
      echo "Enter the first number:"
      read num1
      echo "Enter the second number:"
      read num2
      ;;
   square | sqrt)
      # For square and sqrt, prompt for one number
      echo "Enter the number:"
      read num1
      ;;
   power)
      # For power, prompt for the base and exponent
      echo "Enter the base number:"
      read num1
      echo "Enter the exponent:"
      read num2
      ;;
   *)
      echo "Invalid operation. Please choose add, subtract, multiply, divide, square, power, or sqrt."
      exit 1
      ;;
esac

# Perform the selected operation
case $operation in
   add)
      result=$(add $num1 $num2)
      echo "Result: $result"
      ;;
   subtract)
      result=$(subtract $num1 $num2)
      echo "Result: $result"
      ;;
   multiply)
      result=$(multiply $num1 $num2)
      echo "Result: $result"
      ;;
   divide)
      if [ "$num2" == "0" ]; then
         echo "Error: Division by zero is not allowed."
      else
         result=$(division $num1 $num2)
         echo "Result: $result"
      fi
      ;;
   square)
      result=$(square $num1)
      echo "Square of $num1 is: $result"
      ;;
   sqrt)
      result=$(sqrt $num1)
      echo "Square root of $num1 is: $result"
      ;;
   power)
      result=$(power $num1 $num2)
      echo "$num1 raised to the power of $num2 is: $result"
      ;;
esac

