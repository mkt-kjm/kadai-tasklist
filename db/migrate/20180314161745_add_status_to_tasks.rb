class AddStatusToTasks < ActiveRecord::Migration[5.1]
  def change
    #add_column :content, :status, :stringと書いており、エラー。
    #add_column :xxx,のxxxは既に存在するテーブルでないとダメ。
    #そもそもこのマイグレーションファイルは、カラム追加のためのもの
    add_column :tasks, :status, :string
  end
end
