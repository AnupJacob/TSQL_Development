select * from PokemonTypes;

select * from pokemon;

select * from PokemonTypes;


select type_1 from pokemon;

alter procedure P_searchpokemon
@inputtype varchar(20)
as
begin

select 
	*
from
	pokemon
where 
	Type_1 = @inputtype or
	Type_2 = @inputtype;

print('Thanks for using the search pokemon stored procedure');

end;

exec P_searchpokemon @inputtype = "fire";
select * from PokemonTypes where Type = 'fire';

select Column_1,Name,Type_1,Type_2,Total,hp,Attack,Defense,Sp_Atk,Sp_Def,Speed,Generation,Legendary from pokemon;

select * from pokemon;
select * from v_pokemon;

create index idx_pokemon on pokemon(column_1);
