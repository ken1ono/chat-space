# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_name|text|null: false|
|email|text|null: false, unique: true|
|email_password|text|null: false|

### Association
- has_many :members

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|text|null: false|

### Association
- has many :members
- has many :messages

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


