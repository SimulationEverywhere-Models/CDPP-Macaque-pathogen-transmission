#include (pathogen.inc)

[top]
components : pathogen

[pathogen]
type : cell
dim : (10,10,5)
delay : transport
defaultDelayTime : 100
border : nowrapped 
neighbors : pathogen(-1,-1,0) pathogen(-1,0,0) pathogen(-1,1,0) 
neighbors : pathogen(0,-1,0)  pathogen(0,0,0) pathogen(0,1,0) 
neighbors : pathogen(1,-1,0)  pathogen(1,0,0) pathogen(1,1,0)
neighbors : pathogen(-1,-1,1) pathogen(-1,0,1) pathogen(-1,1,1) 
neighbors : pathogen(0,-1,1)  pathogen(0,0,1) pathogen(0,1,1) 
neighbors : pathogen(1,-1,1)  pathogen(1,0,1) pathogen(1,1,1)
neighbors : pathogen(0,0,-1) pathogen(0,0,-2)

initialvalue : -1
initialCellsValue : pathogen.val

localtransition : nothing
zone : pathogen-trans { (0,0,4)..(9,9,4) }
zone : monkey-gender { (0,0,3)..(9,9,3) }
zone : monkey-movement { (0,0,2)..(9,9,2) }
zone : temple { (0,0,1)..(9,9,1) }
zone : landscape { (0,0,0)..(9,9,0) }

[nothing]
rule : {(0,0,0)} 100 { t } 

[landscape]
rule : {7} 0 { (0,0,0)=-1 }
rule : {(0,0,0)} 100 { t } 

[temple]
rule : {0} 0 { (0,0,0)=-1 }
rule : {(0,0,0)} 100 { t } 

[monkey-movement]
%initial
rule : {if(uniform(0,1)<= #Macro(MonkeyOccupation), 1, 0)} 0 { (0,0,0)=-1 and (0,0,-2)!=5 }
rule : {0} 0 { (0,0,0)=-1 }

%phase 1: intent
rule : {randInt(7) + 11} 100 { (0,0,0)=1 }

%phase 2: choose //forest & female
rule : {41} 100 { (0,0,0)=0 and (0,-1,0)=11 and (0,0,-2)=7 and (0,-1,1)=2 and (0,0,-1)!=8}
rule : {42} 100 { (0,0,0)=0 and (1,-1,0)=12 and (0,0,-2)=7 and (1,-1,1)=2 and (0,0,-1)!=8 }
rule : {43} 100 { (0,0,0)=0 and (1,0,0)=13 and (0,0,-2)=7 and (1,0,1)=2 and (0,0,-1)!=8 }
rule : {44} 100 { (0,0,0)=0 and (1,1,0)=14 and (0,0,-2)=7 and (1,1,1)=2 and (0,0,-1)!=8 }
rule : {45} 100 { (0,0,0)=0 and (0,1,0)=15 and (0,0,-2)=7 and (0,1,1)=2 and (0,0,-1)!=8 }
rule : {46} 100 { (0,0,0)=0 and (-1,1,0)=16 and (0,0,-2)=7 and (-1,1,1)=2 and (0,0,-1)!=8 }
rule : {47} 100 { (0,0,0)=0 and (-1,0,0)=17 and (0,0,-2)=7 and (-1,0,1)=2 and (0,0,-1)!=8 }
rule : {48} 100 { (0,0,0)=0 and (-1,-1,0)=18 and (0,0,-2)=7 and (-1,-1,1)=2 and (0,0,-1)!=8 }

%phase 2: choose //forest & male
rule : {41} 100 { (0,0,0)=0 and (0,-1,0)=11 and (0,0,-2)=7 and (0,-1,1)=1}
rule : {42} 100 { (0,0,0)=0 and (1,-1,0)=12 and (0,0,-2)=7 and (1,-1,1)=1}
rule : {43} 100 { (0,0,0)=0 and (1,0,0)=13 and (0,0,-2)=7 and (1,0,1)=1}
rule : {44} 100 { (0,0,0)=0 and (1,1,0)=14 and (0,0,-2)=7 and (1,1,1)=1}
rule : {45} 100 { (0,0,0)=0 and (0,1,0)=15 and (0,0,-2)=7 and (0,1,1)=1}
rule : {46} 100 { (0,0,0)=0 and (-1,1,0)=16 and (0,0,-2)=7 and (-1,1,1)=1}
rule : {47} 100 { (0,0,0)=0 and (-1,0,0)=17 and (0,0,-2)=7 and (-1,0,1)=1}
rule : {48} 100 { (0,0,0)=0 and (-1,-1,0)=18 and (0,0,-2)=7 and (-1,-1,1)=1}

%phase 2: choose //river & female
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 41)} 100 { (0,0,0)=0 and (0,-1,0)=11 and (0,0,-2)=6 and (0,-1,1)=2 and (0,0,-1)!=8 }
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 42)} 100 { (0,0,0)=0 and (1,-1,0)=12 and (0,0,-2)=6 and (1,-1,1)=2 and (0,0,-1)!=8 }
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 43)} 100 { (0,0,0)=0 and (1,0,0)=13 and (0,0,-2)=6 and (1,0,1)=2 and (0,0,-1)!=8 }
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 44)} 100 { (0,0,0)=0 and (1,1,0)=14 and (0,0,-2)=6 and (1,1,1)=2 and (0,0,-1)!=8 }
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 45)} 100 { (0,0,0)=0 and (0,1,0)=15 and (0,0,-2)=6 and (0,1,1)=2 and (0,0,-1)!=8 }
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 46)} 100 { (0,0,0)=0 and (-1,1,0)=16 and (0,0,-2)=6 and (-1,1,1)=2 and (0,0,-1)!=8 }
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 47)} 100 { (0,0,0)=0 and (-1,0,0)=17 and (0,0,-2)=6 and (-1,0,1)=2 and (0,0,-1)!=8 }
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 48)} 100 { (0,0,0)=0 and (-1,-1,0)=18 and (0,0,-2)=6 and (-1,-1,1)=2 and (0,0,-1)!=8 }

%phase 2: choose //river & male
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 41)} 100 { (0,0,0)=0 and (0,-1,0)=11 and (0,0,-2)=6 and (0,-1,1)=1}
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 42)} 100 { (0,0,0)=0 and (1,-1,0)=12 and (0,0,-2)=6 and (1,-1,1)=1}
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 43)} 100 { (0,0,0)=0 and (1,0,0)=13 and (0,0,-2)=6 and (1,0,1)=1}
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 44)} 100 { (0,0,0)=0 and (1,1,0)=14 and (0,0,-2)=6 and (1,1,1)=1}
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 45)} 100 { (0,0,0)=0 and (0,1,0)=15 and (0,0,-2)=6 and (0,1,1)=1}
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 46)} 100 { (0,0,0)=0 and (-1,1,0)=16 and (0,0,-2)=6 and (-1,1,1)=1}
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 47)} 100 { (0,0,0)=0 and (-1,0,0)=17 and (0,0,-2)=6 and (-1,0,1)=1}
rule : {if(uniform(0,1)>#Macro(RiverCrossRatio), 0, 48)} 100 { (0,0,0)=0 and (-1,-1,0)=18 and (0,0,-2)=6 and (-1,-1,1)=1}

rule : {(0,0,0)+10} 100 { (0,0,0)=11 or (0,0,0)=12 or (0,0,0)=13 or (0,0,0)=14 or (0,0,0)=15 or (0,0,0)=16 or (0,0,0)=17 or (0,0,0)=18 }

%phase 3: constraint // if intent doesn't choose, turn 39 and stay
rule : {31} 100 { (0,0,0)=21 and (0,1,0)=41 }
rule : {32} 100 { (0,0,0)=22 and (-1,1,0)=42 }
rule : {33} 100 { (0,0,0)=23 and (-1,0,0)=43 }
rule : {34} 100 { (0,0,0)=24 and (-1,-1,0)=44 }
rule : {35} 100 { (0,0,0)=25 and (0,-1,0)=45 }
rule : {36} 100 { (0,0,0)=26 and (1,-1,0)=46 }
rule : {37} 100 { (0,0,0)=27 and (1,0,0)=47 }
rule : {38} 100 { (0,0,0)=28 and (1,1,0)=48 }
rule : {39} 100 { (0,0,0)=21 or (0,0,0)=22 or (0,0,0)=23 or (0,0,0)=24 or (0,0,0)=25 or (0,0,0)=26 or (0,0,0)=27 or (0,0,0)=28 }
rule : {(0,0,0)+10} 100 { (0,0,0)>=41 and (0,0,0)<=48 }

%phase 4: move from
rule : {0} 100 { (0,0,0)>=31 and (0,0,0)<=38 }

%phase 4: cannot move from, remain 1
rule : {1} 100 { (0,0,0)=39 }

%phase 4: move to
rule : {1} 100 { (0,0,0)>=51 and (0,0,0)<=58 }
rule : {(0,0,0)} 100 { t } 

[monkey-gender]
%initial
rule : {if(uniform(0,1)<=#Macro(MaleRatio)+0.1, 1, 2)} 100 { (0,0,-1)=1 and (0,0,0)!=1 and (0,0,0)!=2 }
rule : {0} 0 { (0,0,0)=-1 }

%move from
rule : {0} 100 { (0,0,-1)>=31 and (0,0,-1)<=38 }

%move to 
rule : {1} 100 { ((0,0,-1)=51 and (0,-1,0)=1) or ((0,0,-1)=52 and (1,-1,0)=1) or ((0,0,-1)=53 and (1,0,0)=1) or ((0,0,-1)=54 and (1,1,0)=1) or ((0,0,-1)=55 and (0,1,0)=1) or ((0,0,-1)=56 and (-1,1,0)=1) or ((0,0,-1)=57 and (-1,0,0)=1) or ((0,0,-1)=58 and (-1,-1,0)=1)}
rule : {2} 100 { ((0,0,-1)=51 and (0,-1,0)=2) or ((0,0,-1)=52 and (1,-1,0)=2) or ((0,0,-1)=53 and (1,0,0)=2) or ((0,0,-1)=54 and (1,1,0)=2) or ((0,0,-1)=55 and (0,1,0)=2) or ((0,0,-1)=56 and (-1,1,0)=2) or ((0,0,-1)=57 and (-1,0,0)=2) or ((0,0,-1)=58 and (-1,-1,0)=2)}
rule : {(0,0,0)} 100 { t } 

[pathogen-trans]
%initial
rule : {if(uniform(0,1)<=#Macro(InitialInfectionRatio), 2, 1)} 100 { (0,0,-2)=1 and (0,0,0)=0 }
rule : {0} 0 { (0,0,0)=-1 }

%move from
rule : {0} 100 { (0,0,-2)>=31 and (0,0,-2)<=38 }
rule : {(0,0,0)+1} 100 { (0,0,-2)=39 and (0,0,0)>1 and (0,0,0)<4 }
rule : {1} 100 { (0,0,-2)=39 and (0,0,0)=4 }

rule : {1} 100 { (0,0,-2)=51 and (0,-1,0)=4 }
rule : {1} 100 { (0,0,-2)=52 and (1,-1,0)=4 }
rule : {1} 100 { (0,0,-2)=53 and (1,0,0)=4 }
rule : {1} 100 { (0,0,-2)=54 and (1,1,0)=4 }
rule : {1} 100 { (0,0,-2)=55 and (0,1,0)=4 }
rule : {1} 100 { (0,0,-2)=56 and (-1,1,0)=4 }
rule : {1} 100 { (0,0,-2)=57 and (-1,0,0)=4 }
rule : {1} 100 { (0,0,-2)=58 and (-1,-1,0)=4 }

rule : {((0,-1,0)+1)} 100 { (0,0,-2)=51 and (0,-1,0)>1 }
rule : {((1,-1,0)+1)} 100 { (0,0,-2)=52 and (1,-1,0)>1 }
rule : {((1,0,0)+1)} 100 { (0,0,-2)=53 and (1,0,0)>1 }
rule : {((1,1,0)+1)} 100 { (0,0,-2)=54 and (1,1,0)>1 }
rule : {((0,1,0)+1)} 100 { (0,0,-2)=55 and (0,1,0)>1 }
rule : {((-1,1,0)+1)} 100 { (0,0,-2)=56 and (-1,1,0)>1 }
rule : {((-1,0,0)+1)} 100 { (0,0,-2)=57 and (-1,0,0)>1 }
rule : {((-1,-1,0)+1)} 100 { (0,0,-2)=58 and (-1,-1,0)>1 }

rule : {1} 100 { (0,0,-2)=51 and (0,-1,0)=1 }
rule : {1} 100 { (0,0,-2)=52 and (1,-1,0)=1 }
rule : {1} 100 { (0,0,-2)=53 and (1,0,0)=1 }
rule : {1} 100 { (0,0,-2)=54 and (1,1,0)=1 }
rule : {1} 100 { (0,0,-2)=55 and (0,1,0)=1 }
rule : {1} 100 { (0,0,-2)=56 and (-1,1,0)=1 }
rule : {1} 100 { (0,0,-2)=57 and (-1,0,0)=1 }
rule : {1} 100 { (0,0,-2)=58 and (-1,-1,0)=1 }

%get infected
rule : {2} 100 { (0,0,0)=1 and ((0,1,0)>1 or (-1,1,0)>1 or (-1,0,0)>1 or (-1,-1,0)>1 or (0,-1,0)>1 or (1,-1,0)>1 or (1,0,0)>1 or (1,1,0)>1 ) }

rule : {(0,0,0)} 100 { t } 





