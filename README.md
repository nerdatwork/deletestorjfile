# Fix `unable to delete piece` error message from log file on Windows using Powershell

The error looks like 
> 2021-11-30T14:48:49.968Z        ERROR   collector       unable to delete piece  {"Satellite ID": "12L9ZFwhzVpuEKMUNUqkaTLGzwY9G24tbiigLiXpmZWKwmcNDDs", "Piece ID":
"MX666WHSDCSRQGWS7QCUEEWQBVAEB4NYFP56GQF6ATTBIOW6E2NA", "error": "pieces error: filestore error: file does not exist", "errorVerbose": "pieces error: filestore error: file does
not exist\n\tstorj.io/storj/storage/filestore.(*blobStore).Stat:103\n\tstorj.io/storj/storagenode/pieces.(*BlobsUsageCache).pieceSizes:239\n\tstorj.io/storj/storagenode/pieces.(
*BlobsUsageCache).Delete:220\n\tstorj.io/storj/storagenode/pieces.(*Store).Delete:299\n\tstorj.io/storj/storagenode/collector.(*Service).Collect:97\n\tstorj.io/storj/storagenode
/collector.(*Service).Run.func1:57\n\tstorj.io/common/sync2.(*Cycle).Run:92\n\tstorj.io/storj/storagenode/collector.(*Service).Run:53\n\tstorj.io/storj/private/lifecycle.(*Group
).Run.func2.1:87\n\truntime/pprof.Do:40\n\tstorj.io/storj/private/lifecycle.(*Group).Run.func2:86\n\tgolang.org/x/sync/errgroup.(*Group).Go.func1:57"}

# Steps on how to use the script

1: Enter the path to folder containing "storage" folder. If your Storj node is on D drive and the path to "storage" folder is D:\Storj\storage" then enter `D:\Storj`. Press Enter.

2: Enter Satellite ID shown in the error message. As seen from above error its `12L9ZFwhzVpuEKMUNUqkaTLGzwY9G24tbiigLiXpmZWKwmcNDDs`. Press Enter.

3. Enter Piece ID shown in the error message. As seen from above error its `MX666WHSDCSRQGWS7QCUEEWQBVAEB4NYFP56GQF6ATTBIOW6E2NA`. Press Enter.

4. Continue for every error message common to the Satellite ID.

5. If Satellite ID is different. Enter `q` to get back to previous prompt of `Enter Satellite ID` and enter new Satellite ID.





