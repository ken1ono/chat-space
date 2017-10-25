# README

##usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|user_name|text|null: false|
|email|text|null: false, unique: true|
|email_password|text|null: false|

### Association
- has_many :members


##membersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


##groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null: false, foreign_key: true|
|message_id|integer|null: false, foreign_key: true|

### Association
- has many :members
- has many :messages


##messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message_id|integer|null: false, foreign_key: true|
|body|text||
|image|text||

### Association
- belongs_to :group


