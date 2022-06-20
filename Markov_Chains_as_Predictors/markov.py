from __future__ import division
import numpy as np
from scipy.linalg import null_space
import random as rm

class MarkovProcess:
    states = ["Bull", "Stagnant", "Bear"]

    Transition_matrix = [["bull_to_bull", "bull_to_stagnant", "bull_to_bear"],["stagnant_to_bull", "stagnant_to_stagnant", "stagnant_to_bear"], ["bear_to_bull", "bear_to_stagnant", "bear_to_bear"]]

    def __init__(self, transition_prob):
        self.transition_prob = transition_prob

    def checker(self):

        if sum(self.transition_prob[0], self.transition_prob[1], self.transition_prob[2]) != 3:
            print("Sum of entries of each row should add up to 1!")
            return
            
        print("Valid Markov Chain")

    def random_forecast(self, days, start_state):
        curr_state = start_state
        state_list = [curr_state]
        i = 0
        probability = 1

        while i < days:

            if curr_state == "Bull":

                change = np.random.choice(MarkovProcess.Transition_matrix[0], replace=True, p=self.transition_prob[0])
                if change == "bull_to_bull":

                    probability *= self.transition_prob[0][0]
                    state_list.append(curr_state)
                    pass

                elif change == "bull_to_stagnant":

                    probability *= self.transition_prob[0][1]
                    curr_state = "Stagnant"
                    state_list.append("Stagnant")

                else:

                    probability *= self.transition_prob[0][2]
                    curr_state = "Bear"
                    state_list.append("Bear")

            elif curr_state == "Stagnant":

                change = np.random.choice(MarkovProcess.Transition_matrix[1], replace=True, p=self.transition_prob[1])
                if change == "stagnant_to_stagnant":

                    probability *= self.transition_prob[1][1]
                    state_list.append(curr_state)
                    pass

                elif change == "stagnant_to_bull":

                    probability *= self.transition_prob[1][0]
                    curr_state = "Stagnant"
                    state_list.append(curr_state)

                else:

                    probability *= self.transition_prob[1][2]
                    curr_state = "Bear"
                    state_list.append(curr_state)

            else:

                change = np.random.choice(MarkovProcess.Transition_matrix[2], replace=True, p=self.transition_prob[2])
                if change == "bear_to_bear":

                    probability *= self.transition_prob[2][2]
                    state_list.append(curr_state)
                    pass

                elif change == "bear_to_bull":

                    probability *= self.transition_prob[2][0]
                    curr_state = "Bull"
                    state_list.append(curr_state)

                else:
                    
                    probability *= self.transition_prob[2][1]
                    curr_state = "Stagnant"
                    state_list.append(curr_state)

            i += 1

        return state_list + [probability]

    def LLN_simulator(self, days, end_state, start_state):
        count = 0

        forecast_list = []

        for _ in range(days*100):
            forecast_list.append(self.random_forecast(days, start_state))
        
        for iterations in forecast_list:
            if iterations[days] == end_state:
                count += 1
        
        return round((count/days*100)*100, 3)

    def max_stream(self, days, end_state, start_state):
        temp_dict = {}

        for _ in range(days*100):
            state = self.random_forecast(days, start_state)
            if state[days] == end_state:
                temp_dict[days + 1] = state
        
        max_key = max(temp_dict.keys())

        return temp_dict[max_key]

    # Our Markov chain model is irreducible and aperiodic, which ensures the existence of a unique invariant distribution

    # Will use eigenvalue decomposition to solve for the stationary distribution

    def stat_dist(self):
        value_to_normalize = 0

        temp_matrix = self.transition_prob

        p_matrix = np.array(temp_matrix)

        eigenvalues = np.linalg.eigvals(p_matrix)

        eigenvalue = 1

        for i in eigenvalues:
            if i == 1:
                eigenvalue = 1
                break

        for i in range(0, 3):
            p_matrix[i, i] = p_matrix[i, i] - eigenvalue

        p_matrix = null_space(np.transpose(p_matrix))

        for i in range(0, 3):
            value_to_normalize += p_matrix[i]

        for i in range(0, 3):
            p_matrix[i] = abs((p_matrix[i])/value_to_normalize)
        
        return p_matrix

    

    def hitting_equation(self, start_state, desired_state):
        
        
        x, y = MarkovProcess.stateFinder(start_state, desired_state)

        a = self.transition_prob[x][x] - 1
        b = self.transition_prob[x][y]
        c = self.transition_prob[y][x]
        d = self.transition_prob[y][y] - 1
        
        determinant = (a*d) - (b*c)
        if determinant != 0:
            x = (b - d) / determinant
            return round(x, 3)
        else:
            print("ERROR: Determinant is zero\n"
                    "there are either no solutions or many solutions exist.\n")

    def aBeforeB(self, start_state, end_state):
        x, y = MarkovProcess.stateFinder(start_state, end_state)
        a = self.transition_prob[x][y]
        b = 1 - self.transition_prob[x][x]
        return round(a / b, 3)

    
    def stateFinder(start_state, desired_state):
        if start_state == desired_state:
            print("Start state cannot be the desired state.")
            return

        if start_state == "Bull":
            x = 0
            if desired_state == "Stagnant":
                y = 2
            elif desired_state == "Bear":
                y = 1
        elif start_state == "Stagnant":
            x = 1
            if desired_state == "Bull":
                y = 2
            elif desired_state == "Bear":
                y = 0
        elif start_state == "Bear":
            x = 2
            if desired_state == "Bull":
                y = 1
            elif desired_state == "Stagnant":
                y = 0
        else:
            print("No such start state or desired state exists.")
            return
        
        return x, y







        

