1) #####################################
      def add(a, b)
        if a > b
          return a + b
        end

        a - b
      end

2) #####################################
  def print_arr(arr)
    arr.each_with_index do |el, idx|
      break if idx == arr.length / 2 - 1
      puts el
    end

    arr.each_with_index do |el, idx|
      puts el if idx % 3 == 0
    end

    puts arr.last
  end

3) #####################################
  def search(arr, target)
    arr.each_with_index do |el, idx|
      return idx if el == target
    end

    nil
  end

4) #####################################

  for (i = 0; i < N; i++) {
      for (j = i+1; j < N; j++) {
          sequence of statements
      }
  }

5) #####################################

  for (i = 0; i < N; i++) {
    for (j = 0; j < M; j++) {
        sequence of statements
    }
  }

6) #####################################

  for (i = 0; i < N; i++) {
      sequence of statements
  }
  for (j = 0; j < M; j++) {
      sequence of statements
  }

7) #####################################
  for (i = 0; i < N; i++) {
      for (j = 0; j < N; j++) {
          sequence of statements
      }
  }
  for (k = 0; k < N; k++) {
      sequence of statements
  }

8) #####################################

  for (i = 0; i < N; i++) {
      for (j = N; j > i; j--) {
          sequence of statements
      }
  }

9) #####################################

  For each of the following loops with a method call, determine the overall complexity.
  As above, assume that method f takes constant time, and that method g takes time
  linear in the value of its parameter.

  a. for (j = 0; j < N; j++) f(j);

  b. for (j = 0; j < N; j++) g(j);

  c. for (j = 0; j < N; j++) g(k);

10) ###############################
      def wonky_func(arr)
        i = 0
        while(i < arr.length)
          ret_val = add(arr[i], arr[i+1]) if i < arr.length-1
          puts ret_val/100000 + ret_val * 150000
          i *= 2
        end
      end

11) ###############################
      def wonky_func_deux(arr)
        i = arr.length - 1
        while(i > 0)
          search(arr, i)
          i /= 2
        end
      end

12) ###############################
      class Array
        def funky_permutations
          return [[]] if empty?
          perms = take(count - 1).funky_permutations
          perms.concat(perms.map { |perm| perms + [last] })
        end
      end

13) ###############################
      Array.prototype.funky_subsets = function(){
        var subsets = [];
        this.forEach(function(el, idx){
          var temp = [el];
          subsets.push(temp.concat(this.splice(idx,1).funky_subsets()));
        }.bind(this));

        return subsets;
      };

14) ##############################
      int recursiveFun2(int n)
      {
          if (n <= 0)
              return 1;
          else
              return 1 + recursiveFun2(n-5);
      }

15) ##############################
      int recursiveFun3(int n)
      {
          if (n <= 0)
              return 1;
          else
              return 1 + recursiveFun3(n/5);
      }

16) ##############################
    #######BONUS##################
      void recursiveFun4(int n, int m, int o)
      {
          if (n <= 0)
          {
              printf("%d, %d\n",m, o);
          }
          else
          {
              recursiveFun4(n-1, m+1, o);
              recursiveFun4(n-1, m, o+1);
          }
      }

17) ##############################
    #######BONUS##################
      int recursiveFun5(int n)
      {
          for(i=0;i<n;i+=2)
              do something;

          if (n <= 0)
              return 1;
          else
              return 1 + recursiveFun5(n-5);
      }
