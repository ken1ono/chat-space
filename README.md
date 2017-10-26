# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|email|text|null: false, unique: true|
|password|text|null: false|

### Association
- has_many :members
- has_many :groups, through: :members
- has_many :messages

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
|name|text|null: false|

### Association
- has many :members
- has many :users, through: :members
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


