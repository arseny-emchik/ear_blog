class CreatePosts < ActiveRecord::Migration
  def change

    create_table :posts, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :author, null: false
      t.string :title, null: false
      t.text :brief_text, null: false
      t.text :text, null: false
      t.boolean :visible, default: false
      t.timestamps
    end

  end

end
