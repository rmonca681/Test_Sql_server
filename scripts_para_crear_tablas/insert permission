INSERT INTO [dbo].[Permission]
           ([name]
           ,[description]
           ,[can_create]
           ,[can_read]
           ,[can_update]
           ,[can_delete]
           ,[can_import]
           ,[can_export])
VALUES
    -- No permissions
    ('No Access', 'No permissions granted', 0, 0, 0, 0, 0, 0),
    
    -- Read-only combinations
    ('Read Only', 'Can only read records', 0, 1, 0, 0, 0, 0),
    ('Read + Export', 'Can read and export records', 0, 1, 0, 0, 0, 1),
    
    -- Basic CRUD combinations
    ('Create Only', 'Can only create records', 1, 0, 0, 0, 0, 0),
    ('Create + Read', 'Can create and read records', 1, 1, 0, 0, 0, 0),
    ('Create + Read + Export', 'Can create, read and export records', 1, 1, 0, 0, 0, 1),
    ('Update Only', 'Can only update records', 0, 0, 1, 0, 0, 0),
    ('Update + Read', 'Can update and read records', 0, 1, 1, 0, 0, 0),
    ('Delete Only', 'Can only delete records', 0, 0, 0, 1, 0, 0),
    ('Delete + Read', 'Can delete and read records', 0, 1, 0, 1, 0, 0),
    
    -- Standard role combinations
    ('Basic User', 'Can read and create records', 1, 1, 0, 0, 0, 0),
    ('Standard User', 'Can read, create and update records', 1, 1, 1, 0, 0, 0),
    ('Power User', 'Can read, create, update and delete records', 1, 1, 1, 1, 0, 0),
    ('Data Import User', 'Can read and import records', 0, 1, 0, 0, 1, 0),
    ('Data Export User', 'Can read and export records', 0, 1, 0, 0, 0, 1),
    ('Data Manager', 'Can import and export records', 0, 0, 0, 0, 1, 1),
    
    -- Advanced combinations
    ('Content Creator', 'Can create, read and export records', 1, 1, 0, 0, 0, 1),
    ('Content Editor', 'Can read, update and export records', 0, 1, 1, 0, 0, 1),
    ('Content Manager', 'Full access except delete', 1, 1, 1, 0, 1, 1),
    ('Full Access', 'Has all permissions', 1, 1, 1, 1, 1, 1),
    
    -- Import/Export combinations
    ('Import Only', 'Can only import records', 0, 0, 0, 0, 1, 0),
    ('Export Only', 'Can only export records', 0, 0, 0, 0, 0, 1),
    ('Import + Read', 'Can import and read records', 0, 1, 0, 0, 1, 0),
    ('Import + Create', 'Can import and create records', 1, 0, 0, 0, 1, 0),
    ('Import + Update', 'Can import and update records', 0, 0, 1, 0, 1, 0),
    
    -- More specialized roles
    ('Reviewer', 'Can read and export only', 0, 1, 0, 0, 0, 1),
    ('Data Entry', 'Can create and update records', 1, 0, 1, 0, 0, 0),
    ('Data Validator', 'Can read, update and export', 0, 1, 1, 0, 0, 1),
    ('Data Administrator', 'Full access with import/export', 1, 1, 1, 1, 1, 1);
