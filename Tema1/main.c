#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "structs.h"
#include <inttypes.h>

head *initHead(char tip, int lungime){
	head *nod=malloc(sizeof(nod));
	nod->type=tip;
	nod->len=lungime;
	return nod;
}

data_structure *initStructure(){
	data_structure *str=malloc(sizeof(str));
	str->data=NULL;
	str->header=NULL;
	return str;
}


int add_last(void **arr, int *len, data_structure *data)
{
	int pozitie_arr=(*len);
	if((*len)==0){
		(*len)=data->header->len+5;
		*arr=malloc(*len);
	}else{
		(*len)+=data->header->len+5;
		*arr=realloc(*arr, (*len));
	}
	memcpy((char*)*arr+pozitie_arr, data , 1+4+data->header->len);
	return 0;
}

int add_at(void **arr, int *len, data_structure *data, int index)
{
	if(index<0){
		return 33;
	}else if(index==0){
		int lungime_init=*len;
		*len+=5+data->header->len;
		*arr=realloc(*arr,(*len));
		memcpy((char*)*arr+data->header->len+5,*arr,lungime_init);
		memcpy(*arr,data,data->header->len+5);
	}else{
		int ct=0;
		int nr_struct=0;
		int ok=0;
		void *copie=*arr;
		while(ct<*len && ok==0){
			if(nr_struct==index){
				ok=1;
			}
			data_structure *aux = (data_structure*)copie;
			if(ok==0){
				int lungime_data=aux->header->len;
				aux=(char *)aux->data + lungime_data +5;
				ct+=5+lungime_data;
				copie=(char *)copie+ct;
				nr_struct++;
			}
		}
		if(ok==1){
			int lungime_init=*len;
			*len+=data->header->len+5;
			*arr=realloc(*arr, (*len));
			memcpy((char*)*arr+ct+data->header->len+5,(char*)*arr+ct,lungime_init-ct);
			memcpy((char*)*arr+ct,data,data->header->len+5);
			
		}else{
			int lungime_init=*len;
			*len+=5+data->header->len;
			*arr=realloc(*arr,(*len));
			memcpy((char*)*arr+lungime_init,data,data->header->len+5);
		}
	}
	return 0;
}

void find(void *data_block, int len, int index) 
{
	int ct=0;
	int nr_struct=0;
	int ok=0;
	void *copie=data_block;
	if(index<0){
		return;
	}else{
		while(ct<len && ok==0){
			if(nr_struct==index){
				ok=1;
			}
			data_structure *aux = (data_structure*)copie;
			if(ok==0){
				int lungime_data=aux->header->len;
				aux=(char *)aux->data + lungime_data +5;
				ct+=5+lungime_data;
				copie=(char *)copie+ct;
				nr_struct++;
			}
		}
		if(ok==1){
			data_structure *aux = (data_structure*)(data_block+ct);
			printf("Tipul %c\n", aux->header->type);
			aux->data = (char*)aux->data;
			aux->data = (char*)aux->data;
			int lungime1=0;
			while(*((char *)aux->data + lungime1) != '\0'){
				printf("%c",*((char *)aux->data +lungime1));
				lungime1++;	
			}
			printf(" pentru ");
			lungime1++;
			int lungime2=lungime1;
			if(aux->header->type=='1')
				lungime2+=2;
			else if(aux->header->type=='2')
				lungime2+=6;
			else if(aux->header->type=='3')
				lungime2+=8;

			while(*((char *)aux->data + lungime2) != '\0'){
				printf("%c",*((char *)aux->data +lungime2));
				lungime2++;
			}
			if(aux->header->type=='1'){
				void *suma1=(char *)aux->data + lungime1;
				printf("%"PRId8"\n",*(int8_t*)suma1);
				lungime1++;
				void *suma2=(char *)aux->data + lungime1;
				printf("%"PRId8"\n\n",*(int8_t*)suma2);
			}else if(aux->header->type=='2'){
				void *suma1=(char *)aux->data + lungime1;
				printf("%"PRId16"\n",*(int16_t*)suma1);
				lungime1+=2;
				void *suma2=(char *)aux->data + lungime1;
				printf("%"PRId32"\n\n",*(int32_t*)suma2);
			}else if(aux->header->type=='3'){
				void *suma1=(char *)aux->data + lungime1;
				printf("%"PRId32"\n",*(int32_t*)suma1);
				lungime1+=4;
				void *suma2=(char *)aux->data + lungime1;
				printf("%"PRId32"\n\n",*(int32_t*)suma2);
			}
		}else
			return;
	}
}

int delete_at(void **arr, int *len, int index)
{
	int ct=0;
	int nr_struct=0;
	int ok=0;
	void *copie=*arr;
	int gaura=0;
	while(ct<*len && ok==0){
		if(nr_struct==index){
			ok=1;
		}
		data_structure *aux = (data_structure*)copie;
		if(ok==0){
			int lungime_data=aux->header->len;
			aux=(char *)aux->data + lungime_data +5;
			ct+=5+lungime_data;
			copie=(char *)copie+ct;
			nr_struct++;
		}else{
			gaura=aux->header->len+5;
		}
	}
	if(ok==1){
		memcpy((char*)*arr+ct,(char*)*arr+ct+gaura, *(len)-ct-gaura);
		*len-=gaura;
		*arr=realloc(*arr, (*len));
	}else
		return 33;
	return 0;
}

void print(void *arr, int len)
{
	int ct=0;
	while(ct<len){
		data_structure *aux = (data_structure*)arr;
		printf("Tipul %c\n", aux->header->type);
		aux->data = (char*)aux->data;
		int lungime1=0;
		while(*((char *)aux->data + lungime1) != '\0'){
			printf("%c",*((char *)aux->data +lungime1));
			lungime1++;	
		}
		printf(" pentru ");
		lungime1++;
		int lungime2=lungime1;
		if(aux->header->type=='1')
			lungime2+=2;
		else if(aux->header->type=='2')
			lungime2+=6;
		else if(aux->header->type=='3')
			lungime2+=8;

		while(*((char *)aux->data + lungime2) != '\0'){
			printf("%c",*((char *)aux->data +lungime2));
			lungime2++;
		}
		if(aux->header->type=='1'){
			void *suma1=(char *)aux->data + lungime1;
			printf("%"PRId8"\n",*(int8_t*)suma1);
			lungime1++;
			void *suma2=(char *)aux->data + lungime1;
			printf("%"PRId8"\n\n",*(int8_t*)suma2);
		}else if(aux->header->type=='2'){
			void *suma1=(char *)aux->data + lungime1;
			printf("%"PRId16"\n",*(int16_t*)suma1);
			lungime1+=2;
			void *suma2=(char *)aux->data + lungime1;
			printf("%"PRId32"\n\n",*(int32_t*)suma2);
		}else if(aux->header->type=='3'){
			void *suma1=(char *)aux->data + lungime1;
			printf("%"PRId32"\n",*(int32_t*)suma1);
			lungime1+=4;
			void *suma2=(char *)aux->data + lungime1;
			printf("%"PRId32"\n\n",*(int32_t*)suma2);
		}
		arr = (char*)arr + aux->header->len + 5;
		ct+=aux->header->len + 5;
	}
}

int main() {
	void *arr=NULL;
	int len=0;
	char *linie=malloc(256*sizeof(char));
	while(fgets(linie, 256, stdin)){
		char *cuvant;
		if(strstr(linie,"insert ")){
			cuvant=strtok(linie," ");
			cuvant=strtok(NULL," ");
			char tip, *nume1, *suma1, *suma2, *nume2;
			int ct=1;
			while(cuvant != NULL){
				if(ct==1){
					tip=cuvant[0];
				}else if(ct==2){
					nume1=cuvant;
				}else if(ct==3){
					suma1=cuvant;
				}else if(ct==4){
					suma2=cuvant;
				}else if(ct==5){
					nume2=cuvant;
				}
				ct++;
				cuvant=strtok(NULL," ");
			}
			int lungime=0;
			if(tip=='1'){
				lungime=1+1+strlen(nume1)+1+strlen(nume2);					//nu mai adaug terminator pt nume 2 pt ca are un \n
			}else if(tip=='2'){
				lungime=2+4+strlen(nume1)+1+strlen(nume2);
			}else if(tip=='3'){
				lungime=4+4+strlen(nume1)+1+strlen(nume2);
			}
			head *nod=initHead(tip, lungime);
			data_structure *structura=initStructure();
			structura->header=nod;
			structura->data=malloc(lungime);
			int lungime_data=0;
			memcpy((char*)structura->data,nume1,strlen(nume1)+1);

			lungime_data+=strlen(nume1)+1;
			if(tip=='1'){
				int8_t nr1=(int8_t)atoi(suma1);
				int8_t nr2=(int8_t)atoi(suma2);
				memcpy((char*)structura->data+lungime_data,&nr1,1);
				lungime_data++;
				memcpy((char*)structura->data+lungime_data,&nr2,1);
				lungime_data++;
			}else if(tip=='2'){
				int16_t nr1=(int16_t)atoi(suma1);
				int32_t nr2=(int32_t)atoi(suma2);
				memcpy((char*)structura->data+lungime_data,&nr1,2);
				lungime_data+=2;
				memcpy((char*)structura->data+lungime_data,&nr2,4);
				lungime_data+=4;
			}else if(tip=='3'){
				int32_t nr1=(int32_t)atoi(suma1);
				int32_t nr2=(int32_t)atoi(suma2);
				memcpy((char*)structura->data+lungime_data,&nr1,4);
				lungime_data+=4;
				memcpy((char*)structura->data+lungime_data,&nr2,4);
				lungime_data+=4;
			}
			memcpy((char*)structura->data+lungime_data,nume2,strlen(nume2)+1);
			add_last(&arr,&len,structura);

		}else if(strstr(linie,"insert_at ")){
			cuvant=strtok(linie," ");
			cuvant=strtok(NULL," ");
			int index=atoi(cuvant);
			cuvant=strtok(NULL," ");
			char tip, *nume1, *suma1, *suma2, *nume2;
			int ct=1;
			while(cuvant != NULL){
				if(ct==1){
					tip=cuvant[0];
				}else if(ct==2){
					nume1=cuvant;
				}else if(ct==3){
					suma1=cuvant;
				}else if(ct==4){
					suma2=cuvant;
				}else if(ct==5){
					nume2=cuvant;
				}
				ct++;
				cuvant=strtok(NULL," ");
			}
			int lungime=0;
			if(tip=='1'){
				lungime=1+1+strlen(nume1)+1+strlen(nume2);					//nu mai adaug terminator pt nume 2 pt ca are un \n
			}else if(tip=='2'){
				lungime=2+4+strlen(nume1)+1+strlen(nume2);
			}else if(tip=='3'){
				lungime=4+4+strlen(nume1)+1+strlen(nume2);
			}
			head *nod=initHead(tip, lungime);
			data_structure *structura=initStructure();
			structura->header=nod;
			structura->data=malloc(lungime);
			int lungime_data=0;
			memcpy((char*)structura->data,nume1,strlen(nume1)+1);
			lungime_data+=strlen(nume1)+1;
			if(tip=='1'){
				int8_t nr1=(int8_t)atoi(suma1);
				int8_t nr2=(int8_t)atoi(suma2);
				memcpy((char*)structura->data+lungime_data,&nr1,1);
				lungime_data++;
				memcpy((char*)structura->data+lungime_data,&nr2,1);
				lungime_data++;
			}else if(tip=='2'){
				int16_t nr1=(int16_t)atoi(suma1);
				int32_t nr2=(int32_t)atoi(suma2);
				memcpy((char*)structura->data+lungime_data,&nr1,2);
				lungime_data+=2;
				memcpy((char*)structura->data+lungime_data,&nr2,4);
				lungime_data+=4;
			}else if(tip=='3'){
				int32_t nr1=(int32_t)atoi(suma1);
				int32_t nr2=(int32_t)atoi(suma2);
				memcpy((char*)structura->data+lungime_data,&nr1,4);
				lungime_data+=4;
				memcpy((char*)structura->data+lungime_data,&nr2,4);
				lungime_data+=4;
			}
			memcpy((char*)structura->data+lungime_data,nume2,strlen(nume2)+1);
			add_at(&arr,&len,structura,index);

		}else if(strstr(linie,"delete_at ")){
			cuvant=strtok(linie," ");
			cuvant=strtok(NULL," ");
			int index=atoi(cuvant);
			delete_at(&arr, &len,index);
		}else if(strstr(linie,"find ")){
			cuvant=strtok(linie," ");
			cuvant=strtok(NULL," ");
			int index=atoi(cuvant);
			find(arr,len,index);
		}else if(strstr(linie,"print")){
			print(arr,len);
		}else if(strstr(linie,"exit")){
			free(arr);
			break;
		}
	}
	return 0;
}