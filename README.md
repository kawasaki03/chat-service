# README

#テーブル設計

## students テーブル

| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| name      | string    | null: false |
| email     | string    | null: false |
| password  | string    | null: false |
| teacher_id  | references| foreign_key:true |

### Association

- has_many :room_students
- has_many :rooms,through: room_students
- has_many :massages
- belongs_to :teacher
- has_one :teacher_room
- has_many :contacts



## rooms テーブル

| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| name      | string    | null: false |

### Association

- has_many :room_students
- has_many :students,through: room_students
- has_many :massages


## room_students テーブル

| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| student_id   | references| null: false,foreign_key:true |
| room_id   | references| null: false,foreign_key:true |

### Association
- has_many :students
- has_many :rooms


## messages テーブル

| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| content   | string    | null: false |
| checked   | boolean   | null: false |
| student      | references    | null: false,foreign_key:true |
| room      | references    | null: false,foreign_key:true |

### Association
- belongs_to :rooms
- belongs_to :students


## teachersテーブル
| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| name      | string    | null: false |
| email     | string    | null: false |
| password  | string    | null: false |

### Association

- has_many :students
- has_many :teacher_rooms
- has_many :contacts


## teacher_roomsテーブル
| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| name      | string    | null: false |
| student_id   | references| null: false,foreign_key: true, |
| teacher_id  | references| null: false,foreign_key: true, |

### Association

- belongs_to :student
- belongs_to :teacher
- has_many :contacts


## contactsテーブル
| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| content   | string    | null: false |
| student_id   | references| foreign_key: true|
| teacher_id  | references| foreign_key: true|
| teacher_room_id  | references| null: false,foreign_key: true|

### Association

- belongs_to :student
- belongs_to :teacher
- belongs_to :teacher_room