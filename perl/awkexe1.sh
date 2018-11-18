#!/bin/bash
awk -F: 'BEGIN{
printf ("%50s","List of Users\n");
for (i=1;i<=100;i++){printf "-"}
printf("\n%-20s%-40s%-40s\n","UserName","GroupName","Shell Path")
}
{
if($7=="") {printf("%-20s%-30s%-40s\n",$1,$5,$6);arr[$6]++}
else {printf("%-20s%-40s%s:%-30s\n",$1,$5,$6,$7);arr[$6":"$7]++}
}
END{for (i=1;i<=100;i++){printf "-"};
print "";
for (pos in arr)
		printf("%-40s appears %2d times\n",pos,arr[pos])
}' /etc/passwd > awk1.out
