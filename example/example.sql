CREATE
OR REPLACE FUNCTION public.create_new_user () RETURNS trigger COST 100 VOLATILE NOT LEAKPROOF SECURITY DEFINER AS $$ 
    
    import json

    def parseJson(string: str) -> dict:
        return json.loads(string)

    parsed = parseJson('{"food": "apple"}')

    plan = plpy.prepare("insert into food (name) values ($1)", ["character varying"])

    plpy.execute(plan, [parsed["food"]])
    
    return None

$$ LANGUAGE plpython3u;