

from markov import *
print("")
print("Enter the transition probabilities down below:")
bull_to_bull = float(input("Bull to Bull        : "))
bull_to_stag = float(input("Bull to Stagnant    : "))
bull_to_bear = float(input("Bull to Bear        : "))
stag_to_bull = float(input("Stagnant to Bull    : "))
stag_to_stag = float(input("Stagnant to Stagnant: "))
stag_to_bear = float(input("Stagnant to Bear    : "))
bear_to_bull = float(input("Bear to Bull        : "))
bear_to_stag = float(input("Bear to Stagnant    : "))
bear_to_bear = float(input("Bear to Bear        : "))
X = MarkovProcess([[bull_to_bull, bull_to_stag, bull_to_bear], [stag_to_bull, stag_to_stag, stag_to_bear], [bear_to_bull, bear_to_stag, bear_to_bear]])


start_days  = int(input("Enter process time: "))
start_state =     input("Enter start state : ")
end_state   =     input("Enter end state   : ")


print("")
print("---------Results---------")
print("")
print("Random Forecast:         ") 
print(X.random_forecast(start_days, start_state))
print("")
print("Law of Large Numbers:    ") 
print(X.LLN_simulator(start_days, end_state, start_state))
print("")
print("Likely Stream:           ")
print(X.max_stream(start_days, end_state, start_state))
print("")
print("Stationary Distribution: ")
print(X.stat_dist())
print("")
print("Hitting Time:            ") 
print(X.hitting_equation(start_state, end_state))
print("")
print("A Before B:              ")
print(X.aBeforeB(start_state, end_state))
print("")



    
    





