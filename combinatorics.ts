/*
This module contains functions for combinatorics.
Provides functions for:
- Factorial
- Permutations
- Combinations
- Binomial Coefficients
*/


class Combinatorics {
    private memo: { [key: number]: number } = {};
  
    factorial(n: number): number {
      if (n === 0 || n === 1) {
        return 1;
      }
      if (!this.memo[n]) {
        this.memo[n] = n * this.factorial(n - 1);
      }
      return this.memo[n];
    }
  
    permutations(n: number, r: number): number {
      return this.factorial(n) / this.factorial(n - r);
    }
  
    combinations(n: number, r: number): number {
      return this.permutations(n, r) / this.factorial(r);
    }
  
    binomialCoefficient(n: number, r: number): number {
      return this.combinations(n, r);
    }
  }

  // create an export instance of the class
    export const combinatorics = new Combinatorics();