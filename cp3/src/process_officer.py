import pandas as pd
import json

df = pd.read_csv('sunburst_officer.csv')

races = pd.unique(df['race'])
ages = pd.unique(df['age'])
genders = pd.unique(df['gender'])
statuses = pd.unique(df['status'])

children = []
for race in races:
    children_race = []
    df_race = df[df['race'] == race]
    for age in ages:
        children_age = []
        df_age = df_race[df_race['age'] == age]
        for gender in genders:
            children_gender = []
            df_gender = df_age[df_age['gender'] == gender]
            for status in statuses:
                df_status = df_gender[df_gender['status'] == status]
                count = sum(df_status['count'])
                if count > 0:
                    children_gender.append({
                        "name": status,
                        "value": sum(df_status['count'])
                    })
            if len(children_gender) > 0:
                children_age.append({
                    "name": gender,
                    "children": children_gender
                })
        if len(children_age) > 0:
            children_race.append({
                "name": age,
                "children": children_age
            })
    if len(children_race) > 0:
        children.append({
            "name": race,
            "children": children_race
        })

converted = {
    "name": "officer",
    "children": children
}

with open('sunburst_officer.json', 'w') as f:
    f.write(json.dumps(converted, indent=4))
