# README

#テーブル設計

## users テーブル

| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| name      | string    | null: false |
| email     | string    | null: false |
| password  | string    | null: false |
| admin_id  | references| foreign_key:true |

### Association

- has_many :room_users
- has_many :rooms,through: room_users
- has_many :massages
- belongs_to :admin
- has_one :admin_room
- has_many :contacts



## rooms テーブル

| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| name      | string    | null: false |

### Association

- has_many :room_users
- has_many :users,through: room_users
- has_many :massages


## room_users テーブル

| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| user_id   | references| null: false,foreign_key:true |
| room_id   | references| null: false,foreign_key:true |

### Association
- has_many :users
- has_many :rooms


## messages テーブル

| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| content   | string    | null: false |
| checked   | boolean   | null: false |
| user      | references    | null: false,foreign_key:true |
| room      | references    | null: false,foreign_key:true |

### Association
- belongs_to :rooms
- belongs_to :users


## adminsテーブル
| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| name      | string    | null: false |
| email     | string    | null: false |
| password  | string    | null: false |

### Association

- has_many :users
- has_many :admin_rooms
- has_many :contacts


## admin_roomsテーブル
| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| name      | string    | null: false |
| user_id   | references| null: false,foreign_key: true, |
| admin_id  | references| null: false,foreign_key: true, |

### Association

- belongs_to :user
- belongs_to :admin
- has_many :contacts


## contactsテーブル
| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| content   | string    | null: false |
| user_id   | references| foreign_key: true|
| admin_id  | references| foreign_key: true|
| admin_room_id  | references| null: false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :admin
- belongs_to :admin_room