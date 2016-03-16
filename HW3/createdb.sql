SET DEFINE OFF;


create table building(building_id varchar2(5), building_name varchar2(30)  primary key,vertices integer, build_loc sdo_geometry);

create table BUILDINGS_ON_FIRE(building_fire_name varchar2(30), foreign key(building_fire_name) references building(building_name));

create table HYDRANTS_FOR_FIRE(hydrant_id varchar2(5) primary key, hydrant_location sdo_geometry );


INSERT INTO user_sdo_geom_metadata VALUES ('building','build_loc', SDO_DIM_ARRAY(
    SDO_DIM_ELEMENT('X', 0, 820, 0.005),
    SDO_DIM_ELEMENT('Y', 0, 580, 0.005)),NULL);

INSERT INTO user_sdo_geom_metadata VALUES ('HYDRANTS_FOR_FIRE','hydrant_location', SDO_DIM_ARRAY(
    SDO_DIM_ELEMENT('X', 0, 820, 0.005),
    SDO_DIM_ELEMENT('Y', 0, 580, 0.005)),NULL);


CREATE INDEX building_idx
   ON building(build_loc)
   INDEXTYPE IS MDSYS.SPATIAL_INDEX;


CREATE INDEX hydrant_idx
   ON HYDRANTS_FOR_FIRE(hydrant_location)
   INDEXTYPE IS MDSYS.SPATIAL_INDEX;
   