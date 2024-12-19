class Solution:
    def finalPrices(self, prices: List[int]) -> List[int]:
        result = []
        idx = []
        for i in range(len(prices)):
            for j in range(len(prices)):
                if i < j:
                    if prices[i] >= prices[j]:
                        result.append(prices[i] - prices[j])
                        idx.append(i)
                        break
        for x in range(len(prices)):
            if x not in idx:
                result.insert(x, prices[x])
        return result
            
        