
    create table ainfo (
        id int4 not null,
        fname varchar(255),
        fstatus varchar(255),
        ftype varchar(255),
        fvalue varchar(255),
        application_id int4,
        dept_id int4,
        primary key (id)
    );

    create table application (
        id int4 not null,
        GPA varchar(255),
        GRE varchar(255),
        TOEFL varchar(255),
        date timestamp,
        status varchar(255),
        term varchar(255),
        dept_id int4,
        info_id int4,
        program_id int4,
        user_id int4,
        primary key (id)
    );

    create table degree (
        id int4 not null,
        degree_earned varchar(255),
        major varchar(255),
        time_period_attended varchar(255),
        univ_name varchar(255),
        app_id int4,
        primary key (id)
    );

    create table department (
        id int4 not null,
        dept_name varchar(255),
        primary key (id)
    );

    create table department_application (
        department_id int4 not null,
        application_id int4 not null
    );

    create table history (
        id int4 not null,
        comment varchar(255),
        date timestamp,
        name varchar(255),
        application_id int4,
        user_id int4,
        primary key (id)
    );

    create table program (
        id int4 not null,
        name varchar(255),
        department_id int4,
        primary key (id)
    );

    create table roles (
        id int4 not null,
        name varchar(255),
        primary key (id)
    );

    create table userinfo (
        id int4 not null,
        CIN varchar(255),
        DOB varchar(255),
        citizenship varchar(255),
        email varchar(255),
        firstname varchar(255),
        gender varchar(255),
        lastname varchar(255),
        phone varchar(255),
        primary key (id)
    );

    create table users (
        id int4 not null,
        Fname varchar(255),
        Lname varchar(255),
        email varchar(255) not null,
        password varchar(255) not null,
        dept_id int4,
        role_id int4,
        primary key (id)
    );

    alter table department_application 
        add constraint UK_71ygtspng7hwsubvwvjx2wsxm unique (application_id);

    alter table users 
        add constraint UK_6dotkott2kjsp8vw4d0m25fb7 unique (email);

    alter table ainfo 
        add constraint FK_h3jucaluphiv70sn0m4ojp3nb 
        foreign key (application_id) 
        references application;

    alter table ainfo 
        add constraint FK_taquqx3d92w9euv2vwu4ikacn 
        foreign key (dept_id) 
        references department;

    alter table application 
        add constraint FK_j3bac6b5yfyi4n4whpcd1wunl 
        foreign key (dept_id) 
        references department;

    alter table application 
        add constraint FK_logr7dhqr8ditffxmbxbfpr2o 
        foreign key (info_id) 
        references userinfo;

    alter table application 
        add constraint FK_ebwjyxl8e37r6fw1sq8xkj8jy 
        foreign key (program_id) 
        references program;

    alter table application 
        add constraint FK_dkr6bo95o1seayk7xddr9g7n5 
        foreign key (user_id) 
        references users;

    alter table degree 
        add constraint FK_ssrlf1sqddfh8m28nmsb13vdm 
        foreign key (app_id) 
        references application;

    alter table department_application 
        add constraint FK_71ygtspng7hwsubvwvjx2wsxm 
        foreign key (application_id) 
        references application;

    alter table department_application 
        add constraint FK_rj92xi0nxc8jfck1eg28by0a1 
        foreign key (department_id) 
        references department;

    alter table history 
        add constraint FK_eyxergb1sbprhre3qut0023fi 
        foreign key (application_id) 
        references application;

    alter table history 
        add constraint FK_fuutexvtx28fs971iq0kbfbmp 
        foreign key (user_id) 
        references users;

    alter table program 
        add constraint FK_rxdg50tsqawbq3hd5l5whpwey 
        foreign key (department_id) 
        references department;

    alter table users 
        add constraint FK_qapsr64600sbyhd05spxcakau 
        foreign key (dept_id) 
        references department;

    alter table users 
        add constraint FK_krvotbtiqhudlkamvlpaqus0t 
        foreign key (role_id) 
        references roles;

    create sequence hibernate_sequence;
