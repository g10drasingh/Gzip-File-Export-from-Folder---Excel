// This script retrieves CSV.GZ files from a specified folder,
// decompresses them, converts them to CSV format, and promotes headers.
// It then adds a column with the transformed file content and removes unnecessary columns.
let
// Get files from the folder
Source = Folder.Files("Your Folder Containing CSV.GZ Files"), // Replace "Your Folder Containing CSV.GZ Files" with the path to your folder containing CSV.GZ files e.g "C:\Users\jeete\Downloads\Falgun"

// Filter out hidden files
#"Filtered Hidden Files1" = Table.SelectRows(Source, each [Attributes]?[Hidden]? <> true),

// Define a function to handle each file's content
TransformFile = (fileContent as binary) as table =>
    let
        // Decompress the file content
        decompressedData = Binary.Decompress(fileContent, Compression.GZip),
        // Convert decompressed data to CSV table
        csvData = Csv.Document(decompressedData, [Delimiter=",", Encoding=1252, QuoteStyle=QuoteStyle.None]),
        // Promote headers
        promotedHeaders = Table.PromoteHeaders(csvData, [PromoteAllScalars=true])
    in
        promotedHeaders,

// Add a column with transformed file content
#"Invoke Custom Function1" = Table.AddColumn(#"Filtered Hidden Files1", "Transform File", each TransformFile([Content])),

// Remove unnecessary columns
#"Removed Other Columns1" = Table.SelectColumns(#"Invoke Custom Function1", {"Name", "Transform File"}),

// Expand the table column containing transformed file content
#"Expanded Table Column1" = Table.ExpandTableColumn(#"Removed Other Columns1", "Transform File", Table.ColumnNames(#"Transform File"(#"Sample File")))
in
    #"Expanded Table Column1"
