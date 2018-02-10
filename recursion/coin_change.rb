require 'pry'

def coin_change(money, coins, index = 0)
    if index < 0 || index >= coins.length
        return 0
    end
    return 1 if money == 0
    return 0 if money < 0
    return coin_change(money - coins[index], coins, index) + coin_change(money, coins, index + 1)
end

@memo = {}
def coin_change_memo(money, coins, index = 0, memo = {})
    if memo["#{money}:#{index}"]
      return  memo["#{money}:#{index}"]
    end

    if index < 0 || index >= coins.length
        return 0
    end
    return 1 if money == 0
    return 0 if money < 0

    memo["#{money}:#{index}"] = coin_change_memo(money - coins[index], coins, index, memo) + coin_change_memo(money, coins, index + 1, memo)
    return memo["#{money}:#{index}"]
end
