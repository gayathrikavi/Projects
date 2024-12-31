create database sqlproject;
use sqlproject;
-- sheet 2
create table loan_status(loan_id varchar(50), customer_id varchar(50),loan_amount int,loan_amount_term int,cibil_score int,primary key(customer_id));
alter table loan_status modify loan_amount varchar(50);
show tables;
describe loan_status;


create table cibil_status(loan_id varchar(55), loan_amount varchar(55),cibil_score int,cibil_score_status int);
alter table cibil_status add primary key(loan_id);
alter table cibil_status modify cibil_score_status varchar(50);

-- 	Create row level trigger for loan amt 
delimiter ##

create trigger loan_amount_status before insert on loan_status for each row
begin 
if new.loan_amount is null then set new.loan_amount = 'loan still processing';
end if;
end ##
delimiter ;

show triggers;

-- Create statement level trigger for cibil score

delimiter ##

create trigger cibil_score_update after insert on loan_status for each row
begin 
if new.cibil_score>900 then 
insert into cibil_status(loan_id,loan_amount,cibil_score,cibil_score_status) values
(new.loan_id,new.loan_amount,new.cibil_score,'high cibil score');

elseif new.cibil_score>750 then 
insert into cibil_status(loan_id,loan_amount,cibil_score,cibil_score_status) values
(new.loan_id,new.loan_amount,new.cibil_score,'no penalty');

elseif new.cibil_score>250  then 
insert into cibil_status(loan_id,loan_amount,cibil_score,cibil_score_status) values
(new.loan_id,new.loan_amount,new.cibil_score,'penalty customers');

elseif new.cibil_score <0 then 
insert into cibil_status(loan_id,loan_amount,cibil_score,cibil_score_status) values
(new.loan_id,new.loan_amount,new.cibil_score,'reject customers');

end if;
end ##
delimiter ;

insert into loan_status values
('LP001002',	'IP43001',	Null,	360,	303),
('LP001003',	'IP43002',	128,	360,	920),
('LP001005',	'IP43003',	66,	360,	606),
('LP001006',	'IP43004',	120,	360,	851),
('LP001008',	'IP43005',	141,	360,	420),
('LP001011',	'IP43006',	267,	360,	173),
('LP001013',	'IP43007',	95,	360,	650),
('LP001014',	'IP43008',	158,	360,	471),
('LP001018',	'IP43009',	168,	360,	863),
('LP001020',	'IP43010',	349,	360,	730),
('LP001024',	'IP43011',	70,	360,	143),
('LP001027',	'IP43012',	109,	360,	384),
('LP001028',	'IP43013',	200,	360,	928),
('LP001029',	'IP43014',	114,	360,	455),
('LP001030',	'IP43015',	17,	120,	564),
('LP001032',	'IP43016',	125,	360,	477),
('LP001034',	'IP43017',	100,	240,	888),
('LP001036',	'IP43018',	76,	360,	387),
('LP001038',	'IP43019',	133,	360,	371),
('LP001041',	'IP43020',	115,	0,	537),
('LP001043',	'IP43021',	104,	360,	534),
('LP001046',	'IP43022',	315,	360,	903),
('LP001047',	'IP43023',	116,	360,	615),
('LP001050',	'IP43024',	112,	360,	593),
('LP001052',	'IP43025',	151,	360,	79),
('LP001066',	'IP43026',	191,	360,	293),
('LP001068',	'IP43027',	122,	360,	999),
('LP001073',	'IP43028',	110,	360,	781),
('LP001086',	'IP43029',	35,	360,	521),
('LP001087',	'IP43030',	120,	360,	620),
('LP001091',	'IP43031',	201,	360,	972),
('LP001095',	'IP43032',	74,	360,	425),
('LP001097',	'IP43033',	106,	360,	420),
('LP001098',	'IP43034',	114,	360,	667),
('LP001100',	'IP43035',	320,	360,	889),
('LP001106',	'IP43036',	Null,	360,	460),
('LP001109',	'IP43037',	100,	0,	413),
('LP001112',	'IP43038',	144,	360,	139),
('LP001114',	'IP43039',	184,	360,	812),
('LP001116',	'IP43040',	110,	360,	71),
('LP001119',	'IP43041',	80,	360,	374),
('LP001120',	'IP43042',	47,	360,	472),
('LP001123',	'IP43043',	75,	360,	881),
('LP001131',	'IP43044',	134,	360,	80),
('LP001136',	'IP43045',	96,	0,	760),
('LP001137',	'IP43046',	88,	0,	495),
('LP001138',	'IP43047',	44,	360,	197),
('LP001144',	'IP43048',	144,	360,	151),
('LP001146',	'IP43049',	120,	360,	733),
('LP001151',	'IP43050',	144,	360,	187),
('LP001155',	'IP43051',	100,	360,	808),
('LP001157',	'IP43052',	120,	360,	475),
('LP001164',	'IP43053',	112,	360,	359),
('LP001179',	'IP43054',	134,	360,	716),
('LP001186',	'IP43055',	286,	360,	546),
('LP001194',	'IP43056',	97,	360,	509),
('LP001195',	'IP43057',	96,	360,	160),
('LP001197',	'IP43058',	135,	360,	186),
('LP001198',	'IP43059',	180,	360,	781),
('LP001199',	'IP43060',	144,	360,	949),
('LP001205',	'IP43061',	120,	360,	629),
('LP001206',	'IP43062',	99,	360,	803),
('LP001207',	'IP43063',	165,	180,	889),
('LP001213',	'IP43064',	Null,	360,	291),
('LP001222',	'IP43065',	116,	360,	924),
('LP001225',	'IP43066',	258,	360,	261),
('LP001228',	'IP43067',	126,	180,	339),
('LP001233',	'IP43068',	312,	360,	551),
('LP001238',	'IP43069',	125,	60,	227),
('LP001241',	'IP43070',	136,	360,	827),
('LP001243',	'IP43071',	172,	360,	240),
('LP001245',	'IP43072',	97,	360,	245),
('LP001248',	'IP43073',	81,	300,	252),
('LP001250',	'IP43074',	95,	0,	594),
('LP001253',	'IP43075',	187,	360,	520),
('LP001255',	'IP43076',	113,	480,	74),
('LP001256',	'IP43077',	176,	360,	492),
('LP001259',	'IP43078',	110,	360,	399),
('LP001263',	'IP43079',	180,	300,	342),
('LP001264',	'IP43080',	130,	360,	951),
('LP001265',	'IP43081',	111,	360,	431),
('LP001266',	'IP43082',	Null,	360,	499),
('LP001267',	'IP43083',	167,	360,	309),
('LP001273',	'IP43084',	265,	360,	393),
('LP001275',	'IP43085',	50,	240,	933),
('LP001279',	'IP43086',	136,	360,	720),
('LP001280',	'IP43087',	99,	360,	985),
('LP001282',	'IP43088',	104,	360,	789),
('LP001289',	'IP43089',	210,	360,	611),
('LP001310',	'IP43090',	175,	360,	429),
('LP001316',	'IP43091',	131,	360,	497),
('LP001318',	'IP43092',	188,	180,	71),
('LP001319',	'IP43093',	81,	360,	225),
('LP001322',	'IP43094',	122,	360,	148),
('LP001325',	'IP43095',	25,	120,	680),
('LP001326',	'IP43096',	Null,	360,	394),
('LP001327',	'IP43097',	137,	360,	558),
('LP001333',	'IP43098',	50,	360,	994),
('LP001334',	'IP43099',	115,	180,	632),
('LP001343',	'IP43100',	131,	360,	213),
('LP001345',	'IP43101',	133,	180,	759),
('LP001349',	'IP43102',	151,	360,	263),
('LP001350',	'IP43103',	Null,	360,	722),
('LP001356',	'IP43104',	Null,	360,	142),
('LP001357',	'IP43105',	160,	360,	200),
('LP001367',	'IP43106',	100,	360,	157),
('LP001369',	'IP43107',	225,	360,	636),
('LP001370',	'IP43108',	120,	360,	550),
('LP001379',	'IP43109',	216,	360,	231),
('LP001384',	'IP43110',	94,	480,	336),
('LP001385',	'IP43111',	136,	360,	555),
('LP001387',	'IP43112',	139,	360,	680),
('LP001391',	'IP43113',	152,	0,	140),
('LP001392',	'IP43114',	Null,	360,	979),
('LP001398',	'IP43115',	118,	360,	278),
('LP001401',	'IP43116',	185,	180,	478),
('LP001404',	'IP43117',	154,	360,	919),
('LP001405',	'IP43118',	85,	360,	570),
('LP001421',	'IP43119',	175,	360,	375),
('LP001422',	'IP43120',	259,	360,	997),
('LP001426',	'IP43121',	180,	360,	731),
('LP001430',	'IP43122',	44,	360,	483),
('LP001431',	'IP43123',	137,	360,	877),
('LP001432',	'IP43124',	81,	360,	815),
('LP001439',	'IP43125',	194,	360,	213),
('LP001443',	'IP43126',	93,	360,	403),
('LP001448',	'IP43127',	370,	360,	249),
('LP001449',	'IP43128',	Null,	360,	261),
('LP001451',	'IP43129',	160,	180,	929),
('LP001465',	'IP43130',	182,	360,	454),
('LP001469',	'IP43131',	650,	480,	840),
('LP001473',	'IP43132',	74,	360,	208),
('LP001478',	'IP43133',	70,	360,	353),
('LP001482',	'IP43134',	25,	120,	926),
('LP001487',	'IP43135',	102,	360,	688),
('LP001488',	'IP43136',	290,	360,	433),
('LP001489',	'IP43137',	84,	360,	113),
('LP001491',	'IP43138',	88,	360,	129),
('LP001492',	'IP43139',	242,	360,	663),
('LP001493',	'IP43140',	129,	360,	684),
('LP001497',	'IP43141',	185,	360,	266),
('LP001498',	'IP43142',	168,	360,	883),
('LP001504',	'IP43143',	175,	180,	465),
('LP001507',	'IP43144',	122,	360,	291),
('LP001508',	'IP43145',	187,	180,	227),
('LP001514',	'IP43146',	100,	360,	923),
('LP001516',	'IP43147',	70,	360,	129),
('LP001518',	'IP43148',	30,	360,	142),
('LP001519',	'IP43149',	225,	360,	871),
('LP001520',	'IP43150',	125,	360,	193),
('LP001528',	'IP43151',	118,	360,	367),
('LP001529',	'IP43152',	152,	360,	888),
('LP001531',	'IP43153',	244,	360,	484),
('LP001532',	'IP43154',	113,	360,	390),
('LP001535',	'IP43155',	50,	360,	940),
('LP001536',	'IP43156',	600,	180,	738),
('LP001541',	'IP43157',	160,	360,	164),
('LP001543',	'IP43158',	187,	360,	483),
('LP001546',	'IP43159',	120,	360,	424),
('LP001552',	'IP43160',	255,	360,	934),
('LP001560',	'IP43161',	98,	360,	805),
('LP001562',	'IP43162',	275,	360,	538),
('LP001565',	'IP43163',	400,	360,	0),
('LP001570',	'IP43164',	158,	360,	82),
('LP001572',	'IP43165',	75,	180,	227),
('LP001574',	'IP43166',	182,	0,	471),
('LP001577',	'IP43167',	112,	360,	330),
('LP001578',	'IP43168',	129,	360,	61),
('LP001579',	'IP43169',	63,	480,	780),
('LP001580',	'IP43170',	200,	360,	576),
('LP001581',	'IP43171',	95,	360,	258),
('LP001585',	'IP43172',	700,	300,	709),
('LP001586',	'IP43173',	81,	180,	662),
('LP001594',	'IP43174',	187,	360,	371),
('LP001603',	'IP43175',	87,	360,	710),
('LP001606',	'IP43176',	116,	360,	606),
('LP001608',	'IP43177',	101,	360,	789),
('LP001610',	'IP43178',	495,	360,	793),
('LP001616',	'IP43179',	116,	360,	473),
('LP001630',	'IP43180',	102,	480,	440),
('LP001633',	'IP43181',	180,	360,	283),
('LP001634',	'IP43182',	320,	360,	0),
('LP001636',	'IP43183',	73,	180,	433),
('LP001637',	'IP43184',	260,	360,	660),
('LP001639',	'IP43185',	108,	360,	395),
('LP001640',	'IP43186',	120,	360,	72),
('LP001641',	'IP43187',	66,	300,	794),
('LP001643',	'IP43188',	58,	360,	902),
('LP001644',	'IP43189',	168,	360,	582),
('LP001647',	'IP43190',	188,	180,	264),
('LP001653',	'IP43191',	48,	360,	700),
('LP001656',	'IP43192',	164,	360,	513),
('LP001657',	'IP43193',	160,	360,	153),
('LP001658',	'IP43194',	76,	360,	500),
('LP001664',	'IP43195',	120,	360,	114),
('LP001665',	'IP43196',	170,	360,	932),
('LP001666',	'IP43197',	187,	360,	537),
('LP001669',	'IP43198',	120,	0,	520),
('LP001671',	'IP43199',	113,	360,	315),
('LP001673',	'IP43200',	83,	360,	507),
('LP001674',	'IP43201',	90,	360,	420),
('LP001677',	'IP43202',	166,	360,	289),
('LP001682',	'IP43203',	Null,	180,	613),
('LP001688',	'IP43204',	135,	360,	947),
('LP001691',	'IP43205',	124,	360,	642),
('LP001692',	'IP43206',	120,	360,	638),
('LP001693',	'IP43207',	80,	360,	303),
('LP001698',	'IP43208',	55,	360,	816),
('LP001699',	'IP43209',	59,	360,	873),
('LP001702',	'IP43210',	127,	360,	80),
('LP001708',	'IP43211',	214,	360,	814),
('LP001711',	'IP43212',	128,	360,	981),
('LP001713',	'IP43213',	240,	360,	728),
('LP001715',	'IP43214',	130,	360,	738),
('LP001716',	'IP43215',	137,	360,	145),
('LP001720',	'IP43216',	100,	360,	753),
('LP001722',	'IP43217',	135,	360,	249),
('LP001726',	'IP43218',	131,	360,	237),
('LP001732',	'IP43219',	72,	360,	854),
('LP001734',	'IP43220',	127,	360,	751),
('LP001736',	'IP43221',	60,	360,	897),
('LP001743',	'IP43222',	116,	360,	805),
('LP001744',	'IP43223',	144,	360,	637),
('LP001749',	'IP43224',	175,	0,	56),
('LP001750',	'IP43225',	128,	360,	312),
('LP001751',	'IP43226',	170,	360,	931),
('LP001754',	'IP43227',	138,	360,	662),
('LP001758',	'IP43228',	210,	360,	63),
('LP001760',	'IP43229',	158,	480,	108),
('LP001761',	'IP43230',	200,	360,	982),
('LP001765',	'IP43231',	190,	360,	0),
('LP001768',	'IP43232',	42,	180,	414),
('LP001770',	'IP43233',	120,	0,	575),
('LP001776',	'IP43234',	280,	360,	667),
('LP001778',	'IP43235',	140,	360,	171),
('LP001784',	'IP43236',	170,	360,	819),
('LP001786',	'IP43237',	255,	360,	392),
('LP001788',	'IP43238',	122,	360,	129),
('LP001790',	'IP43239',	112,	360,	886),
('LP001792',	'IP43240',	96,	360,	808),
('LP001798',	'IP43241',	120,	360,	668),
('LP001800',	'IP43242',	140,	180,	783),
('LP001806',	'IP43243',	155,	60,	886),
('LP001807',	'IP43244',	108,	360,	659),
('LP001811',	'IP43245',	123,	360,	925),
('LP001813',	'IP43246',	120,	180,	366),
('LP001814',	'IP43247',	112,	360,	871),
('LP001819',	'IP43248',	137,	180,	492),
('LP001824',	'IP43249',	123,	480,	472),
('LP001825',	'IP43250',	90,	360,	216),
('LP001835',	'IP43251',	201,	360,	310),
('LP001836',	'IP43252',	138,	360,	982),
('LP001841',	'IP43253',	104,	360,	91),
('LP001843',	'IP43254',	279,	180,	952),
('LP001844',	'IP43255',	192,	360,	793),
('LP001846',	'IP43256',	255,	360,	309),
('LP001849',	'IP43257',	115,	360,	980),
('LP001854',	'IP43258',	94,	360,	425),
('LP001859',	'IP43259',	304,	360,	243),
('LP001864',	'IP43260',	128,	360,	618),
('LP001865',	'IP43261',	330,	360,	291),
('LP001868',	'IP43262',	134,	360,	418),
('LP001870',	'IP43263',	155,	36,	245),
('LP001871',	'IP43264',	120,	360,	475),
('LP001872',	'IP43265',	128,	360,	583),
('LP001875',	'IP43266',	151,	360,	387),
('LP001877',	'IP43267',	150,	360,	292),
('LP001882',	'IP43268',	160,	360,	56),
('LP001883',	'IP43269',	135,	360,	732),
('LP001884',	'IP43270',	90,	360,	70),
('LP001888',	'IP43271',	30,	360,	438),
('LP001891',	'IP43272',	136,	360,	568),
('LP001892',	'IP43273',	126,	360,	166),
('LP001894',	'IP43274',	150,	360,	952),
('LP001896',	'IP43275',	90,	360,	763),
('LP001900',	'IP43276',	115,	360,	999),
('LP001903',	'IP43277',	207,	360,	468),
('LP001904',	'IP43278',	80,	360,	201),
('LP001907',	'IP43279',	436,	360,	398),
('LP001908',	'IP43280',	124,	360,	320),
('LP001910',	'IP43281',	158,	360,	932),
('LP001914',	'IP43282',	112,	360,	641),
('LP001915',	'IP43283',	78,	180,	818),
('LP001917',	'IP43284',	54,	360,	592),
('LP001922',	'IP43285',	Null,	360,	686),
('LP001924',	'IP43286',	89,	360,	760),
('LP001925',	'IP43287',	99,	300,	497),
('LP001926',	'IP43288',	120,	360,	55),
('LP001931',	'IP43289',	115,	360,	447),
('LP001935',	'IP43290',	187,	360,	718),
('LP001936',	'IP43291',	139,	360,	560),
('LP001938',	'IP43292',	127,	360,	574),
('LP001940',	'IP43293',	134,	360,	172),
('LP001945',	'IP43294',	143,	480,	231),
('LP001947',	'IP43295',	172,	360,	152),
('LP001949',	'IP43296',	110,	360,	702),
('LP001953',	'IP43297',	200,	360,	703),
('LP001954',	'IP43298',	135,	360,	650),
('LP001955',	'IP43299',	151,	480,	587),
('LP001963',	'IP43300',	113,	360,	642),
('LP001964',	'IP43301',	93,	360,	918),
('LP001972',	'IP43302',	105,	360,	405),
('LP001974',	'IP43303',	132,	360,	359),
('LP001977',	'IP43304',	96,	360,	53),
('LP001978',	'IP43305',	140,	360,	98),
('LP001990',	'IP43306',	Null,	360,	969),
('LP001993',	'IP43307',	135,	360,	268),
('LP001994',	'IP43308',	104,	360,	147),
('LP001996',	'IP43309',	480,	360,	362),
('LP001998',	'IP43310',	185,	360,	361),
('LP002002',	'IP43311',	84,	360,	622),
('LP002004',	'IP43312',	111,	360,	116),
('LP002006',	'IP43313',	56,	360,	958),
('LP002008',	'IP43314',	144,	84,	555),
('LP002024',	'IP43315',	159,	360,	713),
('LP002031',	'IP43316',	111,	180,	56),
('LP002035',	'IP43317',	120,	360,	930),
('LP002036',	'IP43318',	88,	360,	126),
('LP002043',	'IP43319',	112,	360,	697),
('LP002050',	'IP43320',	155,	360,	285),
('LP002051',	'IP43321',	115,	360,	654),
('LP002053',	'IP43322',	124,	360,	953),
('LP002054',	'IP43323',	Null,	360,	53),
('LP002055',	'IP43324',	132,	360,	381),
('LP002065',	'IP43325',	300,	360,	819),
('LP002067',	'IP43326',	376,	360,	373),
('LP002068',	'IP43327',	130,	360,	324),
('LP002082',	'IP43328',	184,	360,	900),
('LP002086',	'IP43329',	110,	360,	503),
('LP002087',	'IP43330',	67,	360,	524),
('LP002097',	'IP43331',	117,	360,	139),
('LP002098',	'IP43332',	98,	360,	317),
('LP002100',	'IP43333',	71,	360,	868),
('LP002101',	'IP43334',	490,	180,	555),
('LP002103',	'IP43335',	182,	180,	440),
('LP002106',	'IP43336',	70,	0,	401),
('LP002110',	'IP43337',	160,	360,	389),
('LP002112',	'IP43338',	176,	360,	979),
('LP002113',	'IP43339',	Null,	360,	236),
('LP002114',	'IP43340',	71,	360,	895),
('LP002115',	'IP43341',	173,	360,	365),
('LP002116',	'IP43342',	46,	360,	258),
('LP002119',	'IP43343',	158,	360,	735),
('LP002126',	'IP43344',	74,	360,	90),
('LP002128',	'IP43345',	125,	360,	453),
('LP002129',	'IP43346',	160,	360,	840),
('LP002130',	'IP43347',	152,	360,	319),
('LP002131',	'IP43348',	126,	360,	294),
('LP002137',	'IP43349',	259,	360,	634),
('LP002138',	'IP43350',	187,	360,	544),
('LP002139',	'IP43351',	228,	360,	655),
('LP002140',	'IP43352',	308,	360,	308),
('LP002141',	'IP43353',	95,	360,	102),
('LP002142',	'IP43354',	105,	360,	878),
('LP002143',	'IP43355',	130,	360,	861),
('LP002144',	'IP43356',	116,	180,	766),
('LP002149',	'IP43357',	165,	360,	951),
('LP002151',	'IP43358',	67,	360,	799),
('LP002158',	'IP43359',	100,	480,	397),
('LP002160',	'IP43360',	200,	360,	253),
('LP002161',	'IP43361',	81,	360,	148),
('LP002170',	'IP43362',	236,	360,	675),
('LP002175',	'IP43363',	130,	360,	978),
('LP002178',	'IP43364',	95,	300,	161),
('LP002180',	'IP43365',	141,	360,	234),
('LP002181',	'IP43366',	133,	360,	869),
('LP002187',	'IP43367',	96,	480,	701),
('LP002188',	'IP43368',	124,	0,	98),
('LP002190',	'IP43369',	175,	360,	435),
('LP002191',	'IP43370',	570,	360,	323),
('LP002194',	'IP43371',	55,	360,	331),
('LP002197',	'IP43372',	155,	360,	736),
('LP002201',	'IP43373',	380,	300,	831),
('LP002205',	'IP43374',	111,	180,	699),
('LP002209',	'IP43375',	110,	360,	697),
('LP002211',	'IP43376',	120,	180,	846),
('LP002219',	'IP43377',	130,	360,	158),
('LP002223',	'IP43378',	130,	360,	908),
('LP002224',	'IP43379',	71,	480,	317),
('LP002225',	'IP43380',	130,	360,	203),
('LP002226',	'IP43381',	128,	360,	887),
('LP002229',	'IP43382',	296,	360,	673),
('LP002231',	'IP43383',	156,	360,	443),
('LP002234',	'IP43384',	128,	360,	828),
('LP002236',	'IP43385',	100,	360,	562),
('LP002237',	'IP43386',	113,	180,	52),
('LP002239',	'IP43387',	132,	360,	337),
('LP002243',	'IP43388',	Null,	360,	611),
('LP002244',	'IP43389',	136,	360,	884),
('LP002250',	'IP43390',	125,	360,	320),
('LP002255',	'IP43391',	185,	360,	897),
('LP002262',	'IP43392',	275,	360,	882),
('LP002263',	'IP43393',	120,	360,	946),
('LP002265',	'IP43394',	113,	180,	733),
('LP002266',	'IP43395',	113,	360,	213),
('LP002272',	'IP43396',	135,	360,	507),
('LP002277',	'IP43397',	71,	360,	403),
('LP002281',	'IP43398',	95,	360,	478),
('LP002284',	'IP43399',	109,	360,	216),
('LP002287',	'IP43400',	103,	360,	459),
('LP002288',	'IP43401',	45,	180,	826),
('LP002296',	'IP43402',	65,	300,	971),
('LP002297',	'IP43403',	103,	360,	806),
('LP002300',	'IP43404',	53,	360,	775),
('LP002301',	'IP43405',	194,	360,	99),
('LP002305',	'IP43406',	115,	360,	283),
('LP002308',	'IP43407',	115,	360,	784),
('LP002314',	'IP43408',	66,	360,	822),
('LP002315',	'IP43409',	152,	300,	143),
('LP002317',	'IP43410',	360,	360,	484),
('LP002318',	'IP43411',	62,	360,	779),
('LP002319',	'IP43412',	160,	360,	842),
('LP002328',	'IP43413',	218,	360,	725),
('LP002332',	'IP43414',	110,	360,	607),
('LP002335',	'IP43415',	178,	360,	685),
('LP002337',	'IP43416',	60,	360,	834),
('LP002341',	'IP43417',	160,	360,	260),
('LP002342',	'IP43418',	239,	360,	108),
('LP002345',	'IP43419',	112,	360,	229),
('LP002347',	'IP43420',	138,	360,	718),
('LP002348',	'IP43421',	138,	360,	632),
('LP002357',	'IP43422',	80,	0,	447),
('LP002361',	'IP43423',	100,	360,	190),
('LP002362',	'IP43424',	110,	0,	285),
('LP002364',	'IP43425',	96,	360,	576),
('LP002366',	'IP43426',	121,	360,	555),
('LP002367',	'IP43427',	81,	360,	74),
('LP002368',	'IP43428',	133,	360,	559),
('LP002369',	'IP43429',	87,	360,	625),
('LP002370',	'IP43430',	60,	180,	889),
('LP002377',	'IP43431',	150,	360,	866),
('LP002379',	'IP43432',	105,	360,	61),
('LP002386',	'IP43433',	405,	360,	642),
('LP002387',	'IP43434',	143,	360,	953),
('LP002390',	'IP43435',	100,	360,	539),
('LP002393',	'IP43436',	Null,	240,	345),
('LP002398',	'IP43437',	50,	360,	961),
('LP002401',	'IP43438',	Null,	360,	535),
('LP002403',	'IP43439',	187,	360,	272),
('LP002407',	'IP43440',	138,	360,	865),
('LP002408',	'IP43441',	360,	360,	0),
('LP002409',	'IP43442',	180,	360,	631),
('LP002418',	'IP43443',	148,	360,	130),
('LP002422',	'IP43444',	152,	360,	730),
('LP002424',	'IP43445',	175,	300,	807),
('LP002429',	'IP43446',	130,	360,	127),
('LP002434',	'IP43447',	110,	360,	460),
('LP002435',	'IP43448',	55,	360,	837),
('LP002443',	'IP43449',	150,	360,	486),
('LP002444',	'IP43450',	190,	360,	379),
('LP002446',	'IP43451',	125,	360,	205),
('LP002447',	'IP43452',	60,	300,	802),
('LP002448',	'IP43453',	149,	360,	252),
('LP002449',	'IP43454',	90,	180,	903),
('LP002453',	'IP43455',	84,	360,	100),
('LP002455',	'IP43456',	96,	360,	928),
('LP002459',	'IP43457',	118,	360,	231),
('LP002467',	'IP43458',	173,	360,	918),
('LP002472',	'IP43459',	136,	360,	662),
('LP002473',	'IP43460',	160,	360,	465),
('LP002478',	'IP43461',	160,	360,	965),
('LP002484',	'IP43462',	128,	180,	568),
('LP002487',	'IP43463',	153,	360,	698),
('LP002489',	'IP43464',	132,	360,	214),
('LP002493',	'IP43465',	98,	360,	978),
('LP002494',	'IP43466',	140,	360,	403),
('LP002500',	'IP43467',	70,	180,	292),
('LP002501',	'IP43468',	110,	360,	671),
('LP002502',	'IP43469',	98,	360,	71),
('LP002505',	'IP43470',	110,	360,	167),
('LP002515',	'IP43471',	162,	360,	970),
('LP002517',	'IP43472',	113,	180,	650),
('LP002519',	'IP43473',	100,	360,	649),
('LP002522',	'IP43474',	93,	360,	104),
('LP002524',	'IP43475',	162,	360,	567),
('LP002527',	'IP43476',	150,	360,	984),
('LP002529',	'IP43477',	230,	300,	175),
('LP002530',	'IP43478',	132,	360,	431),
('LP002531',	'IP43479',	86,	360,	416),
('LP002533',	'IP43480',	Null,	360,	910),
('LP002534',	'IP43481',	154,	360,	981),
('LP002536',	'IP43482',	113,	360,	950),
('LP002537',	'IP43483',	128,	360,	226),
('LP002541',	'IP43484',	234,	360,	74),
('LP002543',	'IP43485',	246,	360,	551),
('LP002544',	'IP43486',	131,	360,	547),
('LP002545',	'IP43487',	80,	360,	619),
('LP002547',	'IP43488',	500,	360,	961),
('LP002555',	'IP43489',	160,	360,	77),
('LP002556',	'IP43490',	75,	360,	769),
('LP002560',	'IP43491',	96,	360,	546),
('LP002562',	'IP43492',	186,	360,	504),
('LP002571',	'IP43493',	110,	360,	926),
('LP002582',	'IP43494',	225,	360,	52),
('LP002585',	'IP43495',	119,	360,	976),
('LP002586',	'IP43496',	105,	84,	122),
('LP002587',	'IP43497',	107,	360,	227),
('LP002588',	'IP43498',	111,	12,	761),
('LP002600',	'IP43499',	95,	360,	665),
('LP002602',	'IP43500',	209,	360,	931),
('LP002603',	'IP43501',	113,	480,	261),
('LP002606',	'IP43502',	100,	360,	137),
('LP002615',	'IP43503',	208,	360,	696),
('LP002618',	'IP43504',	138,	360,	197),
('LP002619',	'IP43505',	124,	300,	533),
('LP002622',	'IP43506',	243,	360,	696),
('LP002624',	'IP43507',	480,	360,	601),
('LP002625',	'IP43508',	96,	360,	458),
('LP002626',	'IP43509',	188,	360,	431),
('LP002634',	'IP43510',	40,	360,	834),
('LP002637',	'IP43511',	100,	360,	608),
('LP002640',	'IP43512',	250,	360,	522),
('LP002643',	'IP43513',	148,	360,	111),
('LP002648',	'IP43514',	70,	180,	728),
('LP002652',	'IP43515',	311,	360,	882),
('LP002659',	'IP43516',	150,	360,	512),
('LP002670',	'IP43517',	113,	480,	388),
('LP002682',	'IP43518',	123,	360,	963),
('LP002683',	'IP43519',	185,	360,	563),
('LP002684',	'IP43520',	95,	360,	542),
('LP002689',	'IP43521',	45,	360,	555),
('LP002690',	'IP43522',	55,	360,	400),
('LP002692',	'IP43523',	100,	360,	768),
('LP002693',	'IP43524',	480,	360,	271),
('LP002697',	'IP43525',	Null,	360,	211),
('LP002699',	'IP43526',	400,	360,	818),
('LP002705',	'IP43527',	110,	360,	397),
('LP002706',	'IP43528',	161,	360,	534),
('LP002714',	'IP43529',	94,	360,	773),
('LP002716',	'IP43530',	130,	360,	959),
('LP002717',	'IP43531',	216,	360,	664),
('LP002720',	'IP43532',	100,	360,	276),
('LP002723',	'IP43533',	110,	360,	533),
('LP002729',	'IP43534',	196,	360,	219),
('LP002731',	'IP43535',	125,	360,	832),
('LP002732',	'IP43536',	126,	360,	215),
('LP002734',	'IP43537',	324,	360,	662),
('LP002738',	'IP43538',	107,	360,	624),
('LP002739',	'IP43539',	66,	360,	612),
('LP002740',	'IP43540',	157,	180,	174),
('LP002741',	'IP43541',	140,	180,	188),
('LP002743',	'IP43542',	99,	360,	497),
('LP002753',	'IP43543',	95,	360,	763),
('LP002755',	'IP43544',	128,	360,	393),
('LP002757',	'IP43545',	102,	360,	833),
('LP002767',	'IP43546',	155,	360,	422),
('LP002768',	'IP43547',	80,	36,	878),
('LP002772',	'IP43548',	145,	360,	609),
('LP002776',	'IP43549',	103,	360,	258),
('LP002777',	'IP43550',	110,	360,	376),
('LP002778',	'IP43551',	Null,	360,	160),
('LP002784',	'IP43552',	Null,	360,	80),
('LP002785',	'IP43553',	158,	360,	437),
('LP002788',	'IP43554',	181,	360,	63),
('LP002789',	'IP43555',	132,	180,	867),
('LP002792',	'IP43556',	26,	360,	632),
('LP002794',	'IP43557',	84,	360,	367),
('LP002795',	'IP43558',	260,	360,	720),
('LP002798',	'IP43559',	162,	360,	929),
('LP002804',	'IP43560',	182,	360,	469),
('LP002807',	'IP43561',	108,	360,	656),
('LP002813',	'IP43562',	600,	360,	169),
('LP002820',	'IP43563',	211,	360,	741),
('LP002821',	'IP43564',	132,	360,	70),
('LP002832',	'IP43565',	258,	360,	524),
('LP002833',	'IP43566',	120,	360,	492),
('LP002836',	'IP43567',	70,	360,	713),
('LP002837',	'IP43568',	123,	360,	875),
('LP002840',	'IP43569',	9,	360,	310),
('LP002841',	'IP43570',	104,	360,	271),
('LP002842',	'IP43571',	186,	360,	775),
('LP002847',	'IP43572',	165,	360,	110),
('LP002855',	'IP43573',	275,	360,	286),
('LP002862',	'IP43574',	187,	480,	126),
('LP002863',	'IP43575',	150,	360,	351),
('LP002868',	'IP43576',	108,	84,	982),
('LP002872',	'IP43577',	136,	360,	350),
('LP002874',	'IP43578',	110,	360,	682),
('LP002877',	'IP43579',	107,	360,	804),
('LP002888',	'IP43580',	161,	360,	491),
('LP002892',	'IP43581',	205,	360,	560),
('LP002893',	'IP43582',	90,	360,	92),
('LP002894',	'IP43583',	36,	360,	370),
('LP002898',	'IP43584',	61,	360,	524),
('LP002911',	'IP43585',	146,	360,	371),
('LP002912',	'IP43586',	172,	84,	817),
('LP002916',	'IP43587',	104,	360,	751),
('LP002917',	'IP43588',	70,	360,	588),
('LP002925',	'IP43589',	94,	360,	235),
('LP002926',	'IP43590',	106,	360,	851),
('LP002928',	'IP43591',	56,	180,	73),
('LP002931',	'IP43592',	205,	240,	665),
('LP002933',	'IP43593',	292,	360,	826),
('LP002936',	'IP43594',	142,	180,	704),
('LP002938',	'IP43595',	260,	360,	548),
('LP002940',	'IP43596',	110,	360,	407),
('LP002941',	'IP43597',	187,	360,	257),
('LP002943',	'IP43598',	88,	360,	822),
('LP002945',	'IP43599',	180,	360,	461),
('LP002948',	'IP43600',	192,	360,	556),
('LP002949',	'IP43601',	350,	180,	760),
('LP002950',	'IP43602',	155,	360,	67),
('LP002953',	'IP43603',	128,	360,	465),
('LP002958',	'IP43604',	172,	360,	863),
('LP002959',	'IP43605',	496,	360,	234),
('LP002960',	'IP43606',	Null,	180,	944),
('LP002961',	'IP43607',	173,	360,	201),
('LP002964',	'IP43608',	157,	360,	439),
('LP002974',	'IP43609',	108,	360,	478),
('LP002978',	'IP43610',	71,	360,	982),
('LP002979',	'IP43611',	40,	180,	946),
('LP002983',	'IP43612',	253,	360,	961),
('LP002984',	'IP43613',	187,	360,	121),
('LP002990',	'IP43614',	133,	360,	792);

describe loan_status;
select*from loan_status;
select * from cibil_status;
describe cibil_status;
-- Then delete the reject and loan still processing customers
delete from cibil_status where loan_amount='loan still processing' or cibil_score_status='reject customers';
-- Update loan as integers
alter table cibil_status modify loan_amount int;
-- Create all the above fields as a table 
create table loan_cibil_score_status as select a.loan_id,a.customer_id,a.loan_amount,
a.loan_amount_term,a.cibil_score,b.cibil_score_status
 from loan_status a join cibil_status b on a.loan_id=b.loan_id;
 
select * from loan_cibil_score_status;


-- sheet 1
-- import customer_income_status table
select* from customer_income_status;
-- set customer criteria based on applicant income
create table customer_income select *, if(applicant_income>15000,'GRADE A' ,
if(applicant_income>9000,'GRADE B',
if(applicant_income>5000,'MIDDLE CLASS CUSTOMERS','LOW CLASS'))) as income_status
from customer_income_status;
drop table customer_income;
-- Create this as new table
select * from customer_income;
create table customer_income select *, if(applicant_income>15000,'GRADE A' ,
if(applicant_income>9000,'GRADE B',
if(applicant_income>5000,'MIDDLE CLASS CUSTOMERS','LOW CLASS'))) as income_status_grade,
if(applicant_income<5000 and property_area='rural', 3 ,
if(applicant_income<5000 and property_area='semi rural',3.5,
if(applicant_income<5000 and property_area='urban',5,
if(applicant_income<5000 and property_area='semi urban',2.5,7)))) as monthly_interest
from customer_income_status;
-- Monthly interest percentage
select *, if(applicant_income<5000 and property_area='rural', 3 ,
if(applicant_income<5000 and property_area='semi rural',3.5,
if(applicant_income<5000 and property_area='urban',5,
if(applicant_income<5000 and property_area='semi urban',2.5,7)))) as income_status
from customer_income_status;

select * from customer_income;
-- Calculate monthly interest amt and annual interest amt based on loan amt
-- monthly interest amt
select * from customer_income a join loan_cibil_score_status b on
a.loan_id=b.loan_id limit 500;
select a.*,b.loan_amount,b.loan_amount_term,b.cibil_score,b.cibil_score_status,
(a.monthly_interest*b.loan_amount)/100 as monthly_interest_amount,
((a.monthly_interest*b.loan_amount)/100)*12 as annual_interest_amount
from customer_income a join loan_cibil_score_status b on a.loan_id=b.loan_id limit 500;
-- Create all the above fields as a table 
create table customer_interest_analysis select a.*,b.loan_amount,b.loan_amount_term,b.cibil_score,b.cibil_score_status,
(a.monthly_interest*b.loan_amount)/100 as monthly_interest_amount,
((a.monthly_interest*b.loan_amount)/100)*12 as annual_interest_amount
from customer_income a join loan_cibil_score_status b on a.loan_id=b.loan_id;
select * from  customer_interest_analysis;


-- sheet 3
-- Import the table
select * from customer_info;
-- Update gender and age based on customer id 
update customer_info set gender ='female' where customer_id='IP43006';
update customer_info set gender ='female' where customer_id='IP43016';
update customer_info set gender ='male' where customer_id='IP43018';
update customer_info set gender ='male' where customer_id='IP43038';
update customer_info set gender ='female' where customer_id='IP43508';
update customer_info set gender ='female' where customer_id='IP43577';
update customer_info set gender ='female' where customer_id='IP43589';
update customer_info set gender ='female' where customer_id='IP43593';
update customer_info set age =45 where customer_id='IP43007';
update customer_info set age =32 where customer_id='IP43009';

use sqlproject;
-- Sheet 4 and 5
-- Import the table country state and region
 select * from country_state;
 select * from region_info;
 -- Join all the 5 tables without repeating the fields - output 1 
 create table output1 select c.customer_name,c.gender,
 c.age,c.married,c.education,c.self_employed,a.*,c.region_id,
 d.postal_code,d.segment,d.state,e.region from customer_interest_analysis a join loan_cibil_score_status b
 on a.customer_id=b.customer_id join customer_info c on a.customer_id=c.customer_id
 join country_state d on a.customer_id=d.customer_id join region_info e on
 d.region_id=e.region_id;
 select * from loan_cibil_score_status;
 select * from customer_interest_analysis;
 select * from output1;
 -- find the mismatch details using joins - output 2
 select * from country_state a right join region_info b
 on a.region_id=b.region_id;
-- Filter high cibil score - output 3
select c.customer_name,c.gender,
 c.age,c.married,c.education,c.self_employed,a.*,b.loan_amount_term,b.cibil_score
 ,b.cibil_score_status,c.region_id,
 d.postal_code,d.segment,d.state,e.region from customer_interest_analysis a join loan_cibil_score_status b
 on a.customer_id=b.customer_id join customer_info c on a.customer_id=c.customer_id
 join country_state d on a.customer_id=d.customer_id join region_info e on
 d.region_id=e.region_id where b.cibil_score_status='high cibil score';
 select * from cibil_status;
 -- Filter home office and corporate - output 4
 select c.customer_name,c.gender,
 c.age,c.married,c.education,c.self_employed,a.*,b.loan_amount_term,b.cibil_score
 ,b.cibil_score_status,c.region_id,
 d.postal_code,d.segment,d.state,e.region from customer_interest_analysis a join loan_cibil_score_status b
 on a.customer_id=b.customer_id join customer_info c on a.customer_id=c.customer_id
 join country_state d on a.customer_id=d.customer_id join region_info e on
 d.region_id=e.region_id where segment in('home office','corporate');
-- Store all the outputs as procedure
/* procedure
	-- a stored procedure is a prepared sql code you can save,
    code can be reused */
    delimiter ##
create procedure store_data() 
begin
 select * from output1;
 select * from country_state a right join region_info b
 on a.region_id=b.region_id;
 select c.customer_name,c.gender,
 c.age,c.married,c.education,c.self_employed,a.*,b.loan_amount_term,b.cibil_score
 ,b.cibil_score_status,c.region_id,
 d.postal_code,d.segment,d.state,e.region from customer_interest_analysis a join loan_cibil_score_status b
 on a.customer_id=b.customer_id join customer_info c on a.customer_id=c.customer_id
 join country_state d on a.customer_id=d.customer_id join region_info e on
 d.region_id=e.region_id where b.cibil_score_status='high cibil score';
 select c.customer_name,c.gender,
 c.age,c.married,c.education,c.self_employed,a.*,b.loan_amount_term,b.cibil_score
 ,b.cibil_score_status,c.region_id,
 d.postal_code,d.segment,d.state,e.region from customer_interest_analysis a join loan_cibil_score_status b
 on a.customer_id=b.customer_id join customer_info c on a.customer_id=c.customer_id
 join country_state d on a.customer_id=d.customer_id join region_info e on
 d.region_id=e.region_id where segment in('home office','corporate');
end ##
delimiter ;
call store_data();
    