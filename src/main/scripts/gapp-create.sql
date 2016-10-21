
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
    
    insert into ainfo values (1, 'GMAT', 'required', 'number', '290', 1, 1);

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
    
    insert into application values (1, '3.5', '312', '6.5', '10/12/2015', 'New', 'Fall 2016', 1, 1, 1, 4);

    create table degree (
        id int4 not null,
        degree_earned varchar(255),
        major varchar(255),
        time_period_attended varchar(255),
        univ_name varchar(255),
        app_id int4,
        primary key (id)
    );
    
    insert into degree values (1, 'Pre-Univ', 'Accounting', '2009-11', 'VTU', 1);
	insert into degree values (2, 'Bachelors', 'Accounting', '2011-15', 'VTU', 1);

    create table department (
        id int4 not null,
        dept_name varchar(255),
        primary key (id)
    );
    
    insert into department values (1, 'Accounting');
    insert into department values (2, 'Computer Science');

    create table department_application (
        department_id int4 not null,
        application_id int4 not null
    );
    
    insert into department_application values (1, 1);

    create table history (
        id int4 not null,
        comment varchar(255),
        date timestamp,
        name varchar(255),
        application_id int4,
        user_id int4,
        primary key (id)
    );

    insert into history values (1, '', '10/12/2015', 'New', 1, null);
    
    create table program (
        id int4 not null,
        name varchar(255),
        department_id int4,
        primary key (id)
    );
    
    insert into program values (1, 'MS in Accounting', 1);
    insert into program values (2, 'MS in Computer Science', 2);

    create table roles (
        id int4 not null,
        name varchar(255),
        primary key (id)
    );
    
    insert into roles values (1, 'admin');
    insert into roles values (2, 'staff1');
    insert into roles values (3, 'staff2');
    insert into roles values (4, 'student1');
    insert into roles values (5, 'student2');
    
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

    insert into userinfo values (1, '304360958', '7/7/1992', 'Indian', 'anisha@gmail.com', 'Anisha1', 'female', 'Amarnath1', '626-988-1234');

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
    
    insert into users values (1, 'Nischal', 'Gowda', 'admin@localhost.localdomain', 'abcd', null, 1);
    insert into users values (2, 'Hani', 'Jose', 'staff1@localhost.localdomain', 'abcd', null, 2);
    insert into users values (3, 'Sheethal', 'Gowda', 'staff2@localhost.localdomain', 'abcd', null, 3);
    insert into users values (4, 'Anisha', 'Amarnath', 'student1@localhost.localdomain', 'abcd',  1, 4);
    insert into users values (5, 'Nikhil', 'Kamath', 'student2@localhost.localdomain', 'abcd', 2, 5);

    alter table department_application 
        add constraint UK_71ygtspng7hwsubvwvjx2wsxm unique (application_id);

    alter table users 
        add constraint UK_6dotkott2kjsp8vw4d0m25fb7 unique (email);

    alter table ainfo 
        add constraint FK_h3jucaluphiv70sn0m4ojp3nb 
        foreign key (application_id) 
        references application on delete set null;

    alter table ainfo 
        add constraint FK_taquqx3d92w9euv2vwu4ikacn 
        foreign key (dept_id) 
        references department on delete set null;

    alter table application 
        add constraint FK_j3bac6b5yfyi4n4whpcd1wunl 
        foreign key (dept_id) 
        references department on delete set null;

    alter table application 
        add constraint FK_logr7dhqr8ditffxmbxbfpr2o 
        foreign key (info_id) 
        references userinfo on delete set null;

    alter table application 
        add constraint FK_ebwjyxl8e37r6fw1sq8xkj8jy 
        foreign key (program_id) 
        references program on delete set null;

    alter table application 
        add constraint FK_dkr6bo95o1seayk7xddr9g7n5 
        foreign key (user_id) 
        references users on delete set null;

    alter table degree 
        add constraint FK_ssrlf1sqddfh8m28nmsb13vdm 
        foreign key (app_id) 
        references application on delete set null;

    alter table department_application 
        add constraint FK_71ygtspng7hwsubvwvjx2wsxm 
        foreign key (application_id) 
        references application on delete set null;

    alter table department_application 
        add constraint FK_rj92xi0nxc8jfck1eg28by0a1 
        foreign key (department_id) 
        references department on delete set null;

    alter table history 
        add constraint FK_eyxergb1sbprhre3qut0023fi 
        foreign key (application_id) 
        references application on delete set null;

    alter table history 
        add constraint FK_fuutexvtx28fs971iq0kbfbmp 
        foreign key (user_id) 
        references users on delete set null;

    alter table program 
        add constraint FK_rxdg50tsqawbq3hd5l5whpwey 
        foreign key (department_id) 
        references department on delete set null;

    alter table users 
        add constraint FK_qapsr64600sbyhd05spxcakau 
        foreign key (dept_id) 
        references department on delete set null;

    alter table users 
        add constraint FK_krvotbtiqhudlkamvlpaqus0t 
        foreign key (role_id) 
        references roles on delete set null;

    create sequence hibernate_sequence minvalue 100;
