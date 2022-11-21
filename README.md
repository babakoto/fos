## Fos ( Failure or Success)

###  Services

       class UserService {
		     Future<AppUser> getCurrentUser() async {  
		          try {  
		            final response = await dio.get("/users");  
		            return AppUser.fromJson(response.data);  
		          } on DioError catch (e) {  
		            switch (e.response?.statusCode) {  
		              case 500:  
		                throw const ServerException();  
		               case 401:
		               case 403:
		                throw const UnauthorizedException();  
		              default:  
		                 throw const UnknownException(message: "$e");  
		          }  
		          } catch (e) {  
		            rethrow;  
		          }  
		    }   
    }


###  Repositories

    Future<Fos<Failure,AppUser>> getCurrentUser()async{ 
		  try{
		    final appUser = await this.userService.getCurrentUser();
		    return SuccessResponse(appUser);
		    
		  }on ServerException catch(e){
			  return FailureResponse(ServerFailure(message:e.message,code:e.code));
			  
		  }on NetworkException catch(e){
		 	return FailureResponse(NetworkFailure(message:e.message));
		 	
		  }on UnauthorizedException catch(e){
		    return FailureResponse(UnauthorizedFailure(message:e.message,code:e.code));
		  }
    }

### State manager

#### BLOC :




    FutureOr<void> _onGetCurrentUser(  
        OnGetCurrentUser event, Emitter<AuthState> emit) async {  
          emit(state.copyWith(status: AuthStatus.loading));  
          final result = await getCurrentUserUseCase();  
	      result.on(  
	        (failure) { 
	            emit(state.copyWith(status: AuthStatus.failure, currentUser: null));  
	        },  
	        (success) {  
	          emit(  
	            state.copyWith(  
	              status: AuthStatus.authorized,
	              currentUser: success
	              )
	           );  
	       },  
	     );  
    }

