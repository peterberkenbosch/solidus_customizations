class CreateSpreeCustomizations < ActiveRecord::Migration
  def change
    create_table :spree_customizations do |t|
      t.references :source, polymorphic: true
      t.references :customizable, polymorphic: true
      t.references :configuration, polymorphic: true
      t.references :option, polymorphic: true

      t.string :virtual_proof_url
      t.attachment :virtual_proof
      t.boolean :virtual_proof_changed, default: false

      t.timestamps null: true
    end

    add_index :spree_customizations, [:source_id]
    add_index :spree_customizations, [:source_id, :source_type]
    add_index :spree_customizations, [:customizable_id]
    add_index :spree_customizations, [:customizable_id, :customizable_type], name: 'index_spree_cstms_on_cstmzble_id_and_cstmzble_typ'
    add_index :spree_customizations, [:configuration_id]
    add_index :spree_customizations, [:configuration_id, :configuration_type], name: 'index_spree_cstms_on_cnfg_id_and_cnfg_typ'
    add_index :spree_customizations, [:option_id]
    add_index :spree_customizations, [:option_id, :option_type]
  end
end