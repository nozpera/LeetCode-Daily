import pandas as pd

def order_scores(scores: pd.DataFrame) -> pd.DataFrame:
    scores['score'] = scores['score'].sort_values(ascending=False, ignore_index=True)
    scores['rank'] = scores['score'].rank(method='dense', ascending=False).astype(int)
    return scores[['score', 'rank']]