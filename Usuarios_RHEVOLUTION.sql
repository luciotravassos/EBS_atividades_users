/* Esse Script seleciona os usuarios do RHEVOLUTION E SEUS PERFILS
VEJA TB A QUERY select * from RSL_USUARIO_PERFIS */
select fper.id_funcionario, fun.nome, per.codigo, per.descricao
from funcionario_perfis fper 
join perfis per on (per.codigo = fper.codigo_perfil)
join funcionarios fun on (fun.id = fper.id_funcionario)
where (fper.termino_validade is null or fper.termino_validade > sysdate)
order by 2,3
